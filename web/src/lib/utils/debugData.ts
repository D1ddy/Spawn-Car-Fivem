import { isEnvBrowser } from "$lib/utils/misc";
import type { NuiMessage } from "$lib/utils/types";

/**
 * Emulates dispatching an event using SendNuiMessage in the lua scripts.
 * This is used when developing in browser
 *
 * @param events - The event you want to cover
 * @param timer - How long until it should trigger (ms)
 */
export const debugData = <P>(events: NuiMessage<P>[], timer = 1000): void => {
	if (isEnvBrowser()) {
		for (const event of events) {
			setTimeout(() => {
				window.dispatchEvent(
					new MessageEvent("message", {
						data: {
							action: event.action,
							data: event.data,
						},
					}),
				);
			}, timer);
		}
	}
};
