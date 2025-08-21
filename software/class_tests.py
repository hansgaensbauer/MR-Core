import mrc
import tempfile

ir_pulseq_object = mrc.build_ir(10e-3, 1e-3, 100, 200e-6, 200e-6)
print(type(ir_pulseq_object))
mrc.compile_sequence(ir_pulseq_object, "test_ir.mrc")

with open("test_ir.mrc", 'rb') as f:
    byte_array = bytearray(f.read())
    # byte_array = np.flip(np.reshape(byte_array, (-1,2)), axis=1)
    f.seek(0, 2)
    file_size = int(f.tell())

print(byte_array)
print(file_size)

with tempfile.NamedTemporaryFile() as temp_file:
    mrc.compile_sequence(ir_pulseq_object, temp_file)
    temp_file.seek(0)
    byte_array = bytearray(temp_file.read())
    temp_file.seek(0, 2)
    file_size = int(temp_file.tell())

print(byte_array)
print(file_size)