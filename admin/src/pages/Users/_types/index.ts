export interface IInputProps<T = HTMLInputElement> {
    value: string;
    handleChange: React.ChangeEventHandler<T>,
    additionalClasses: string;
    errorMessage: string;
}