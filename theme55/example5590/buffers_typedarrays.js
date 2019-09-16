const arr = new Uint16Array(2);
arr[0]=5;
arr[1]=7;
console.log(arr);

// создаём буфер, состоящий из всех элементов массива arr - два элемента, значит, получится буфер из 2 байт
const buf1 = Buffer.from(arr);
console.log(buf1);

// у типизированных массивов есть свойство buffer типа ArrayBuffer, из него тоже можно создать Buffer, соответствующий внутреннему представлению массива
// это массив 16-битных (двухбайтовых) целых, значит, получится буфер из 4 байт
const buf2 = Buffer.from(arr.buffer);
console.log(buf2);

// буфер можно менять
buf2[1]=1;
console.log(buf2);
// и раз мы добавили 1 в старший байт первого целого числа, значит, к arr[0] добавилось 256
console.log(arr);
