import { PermissionStatus } from 'unimodules-permissions-interface';
const noPermissionResponse = {
    status: PermissionStatus.UNDETERMINED,
    canAskAgain: true,
    granted: false,
    expires: 'never',
};
export default {
    get name() {
        return 'ExpoBrightness';
    },
    async getPermissionsAsync() {
        return noPermissionResponse;
    },
    async requestPermissionsAsync() {
        return noPermissionResponse;
    },
};
//# sourceMappingURL=ExpoBrightness.web.js.map