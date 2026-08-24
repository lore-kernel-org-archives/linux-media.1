Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C045C6E3
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587003; cv=none; b=KcRpX7vnHQ00wtrZ0nOwpKB5wTefvK5tr4RN4BTe5EVMrtVfk33aJjPVMY6wTL358zauG8vvCuRdy6mnzOkgvE5nji/dlUQTl6ptYG4F/7rr39Pz+ZpfvFQoaZnf5u9/xKolhmq6nhJrLN+g7Atpe1L8hJCqH/cVZ6DsQon4ku0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587003; c=relaxed/simple;
	bh=uO+FlapmPISqgzvlHWT7A/PRH9au4RHwxIrIqEw4NqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWwNllEoR46QfcqUV0n7J4JeLp0bTXmB5O86caknB/34uig1GMcpnXzPoUVG05o0J3VNXCi3j4QskglARGX30KvaHFvrcoSt2T0Iv1PT6XLG3b1rD0nZaFCjGqbzieFjvGfnIs4Nd7dU5VgGbSrXijyD5D1lVQDXbLG+h+UHDsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=P9tezz3m; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="P9tezz3m"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso5539774a91.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 08:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787586994; x=1788191794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ3ukP91qVL4UwV52qeMYFaB9h7OFZKEqbp7w0YVgIg=;
        b=P9tezz3mhSL0drTXlj7mMIBxRu98zWR+eg/4wy9Lqt4YY88iXJj74UWhv9jqVCn8G1
         FJfTrDOUrlw13fn2g9w7f6vFJC5EiLRqXLqKbePx3Zoe+ntGCOPP1ZH9tiiDXyo6v2gg
         kpYXkdIvStEi8VYXQUxIUAbiJBhy5PpqfFmAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586994; x=1788191794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ3ukP91qVL4UwV52qeMYFaB9h7OFZKEqbp7w0YVgIg=;
        b=pnbVSjCg5zNWL+CORnEeuZyQPy0ahYal7NIdJgNQrkeNJKoVfytsJKymVz50h1hjKV
         nZIZVUapruPsl8GFtfeOLq4/mO5TlS35asB1GNSBkRhJ6O8SZDBPKr07PK3MI5c/fJsW
         YpUXmXiHWJeiThsrufnztDG6rr84pKvXD618Q7B+89T+Yh/OGTxNCpgafUgNmMYzZoGx
         zlZbs3Dgv8NrBp2HyfhJh8McbbfrlBHiQQmMCMkX/rVkVSlm89Sj7W4D9CuTP6xLLLxH
         rsbI+VVdxp7QLQh2hF4B1YX6klYOHcokp6QZOMPSQPjyjJ4a8AkO+8K3THyWIxpLHbQk
         3U1w==
X-Forwarded-Encrypted: i=1; AHgh+Rpkg9xsM9hXQBhKOYJj0vJS4vJHEqOrZDY+E6sLNkFEfKAPM79syZN4NZEIvjKs7Jh5lhf4RW1NWJ4zUw==@vger.kernel.org
X-Gm-Message-State: AFuF++lf+iw21deI2RH6ayzCzopz4wdWpH5IElhYAu4BVGQbJIWlBC1z
	+Nb2kLGeLwPQQKVxzZOZ0tZiUcSKfoSeX2JggZq5GBodQGHBtMOFHYVO1/0DA9STC1OlN0GWUkF
	KHPlgxZM=
X-Gm-Gg: AR+sD12lFu5pFcORMOlp8v2MKuvmt3cK46pnxF7id6ZU6HQXmDczOdiBxcIDK81QApQ
	twsP6veTzlU1Odb4JOmFx+AD0gDc5VpetCciq0+zSLyqzPXRIE+T55mEz8WmzWXrW+n7v2liIFN
	Dj4Ls6zNfVb2ul3V01OhiHzOYQ1GlJsJE4agJJfDltxidhJEFoxuMJUophgqcZcQAlTyuTOUULd
	EtUImk7z+6ooUb3b1DmeMym2HGhh/jJAjd7Lv6YLrqeAxgbm2VeuFzKJJztFXOEga6j/EUBtB6x
	XbzjMgM9WLWnDxpjSlTKsn9pvfjNkF1cXEYy7h6HfKJL8lBn9afw7u3gY0FVbUg9iyCtBpTjw6d
	GGOSwNa9fFgWV4vkSaS6uC+tkyNHO1epouoQBBAD/Mkkn+GaRrk5CjgsToz2hqVJdWczF6NBK8s
	gy3PO7p91OgiCxwPwvfInijBTBiHulRubGE9OIelPrH5UtvpkYJ5+0ttCFklXvJv2wPltsXUg4f
	xyNMYDpxu9X4CDOWB0jy5LoX+MkFInvcPn46tSAgyXeMwunJI/Niu6OESkbAzc/mPP4nVosKENW
	BV+BRb49CXnPk4ubztmXN7cPquFMHxxSsT520WRN3J/AxB0EHDH7fg==
X-Received: by 2002:a17:90b:54d0:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-395c35188fcmr54068492a91.1.1787586994592;
        Mon, 24 Aug 2026 08:56:34 -0700 (PDT)
Received: from leesin ([147.46.121.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31e8csm34039a91.9.2026.08.24.08.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:56:34 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	sumit.semwal@linaro.org
Cc: linux-kernel@vger.kernel.org,
	eulgyukim@snu.ac.kr,
	jjy600901@snu.ac.kr
Subject: [BUG] WARNING: refcount bug in sync_timeline_signal
Date: Tue, 25 Aug 2026 00:56:28 +0900
Message-ID: <20260824155629.2370441-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We found a "WARNING: refcount bug in sync_timeline_signal" on Linux v7.2.
The issue was found by our own race fuzzer. We have not analyzed the root cause,
so we do not have a proposed fix to offer.

To reproduce the race reliably, we applied the delay patch below to the
kernel and ran the C reproducer as root inside an x86_64 QEMU guest. The
crash log we observed, the delay patch and the reproducer are all included
below.

The following kernel config options are required to reproduce the issue:
    CONFIG_SW_SYNC=y
    CONFIG_SYNC_FILE=y
    CONFIG_DMA_SHARED_BUFFER=y
    CONFIG_DEBUG_FS=y
    CONFIG_KASAN=y

We hope this report is useful. Please let us know if any further
information would help.

Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Kernel delay patch:
==================================================================
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..d30ce9d915ba 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -8,6 +8,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/uaccess.h>
+#include <linux/delay.h>
 #include <linux/panic.h>
 #include <linux/slab.h>
 #include <linux/sync_file.h>
@@ -215,6 +216,10 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 
 	spin_lock_irq(&obj->lock);
 
+	if (strncmp(current->comm, "syzrepro1", 9) == 0) {
+		mdelay(50);
+	}
+
 	obj->value += inc;
 
 	list_for_each_entry_safe(pt, next, &obj->pt_list, link) {
==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

#define SYSCHK(x) ({ long __r = (long)(x); if (__r == -1L) { perror(#x); exit(1); } __r; })

#define SW_SYNC_IOC_CREATE_FENCE 0xc0285700u
#define SW_SYNC_IOC_INC 0x40045701u
#define SWSYNC "/sys/kernel/debug/sync/sw_sync"
#define BIAS_US 2000

struct fence_data {
	uint32_t value;
	char name[32];
	int32_t fence;
};

static volatile int g_round, g_stop, g_tl_fd = -1, g_fence_fd = -1;
static volatile int g_armed, g_done0, g_done1;

static void spin_us(long us)
{
	struct timespec a, b;

	clock_gettime(CLOCK_MONOTONIC, &a);
	do {
		clock_gettime(CLOCK_MONOTONIC, &b);
		__asm__ __volatile__("pause" ::: "memory");
	} while ((b.tv_sec - a.tv_sec) * 1000000L + (b.tv_nsec - a.tv_nsec) / 1000L < us);
}

static void pin_cpu(int cpu)
{
	cpu_set_t set;

	CPU_ZERO(&set);
	CPU_SET(cpu, &set);
	sched_setaffinity(0, sizeof(set), &set);
}

static int wait_round(int *last)
{
	while (g_round == *last && !g_stop)
		sched_yield();
	if (g_stop)
		return 0;
	*last = g_round;
	return 1;
}

/* T1: advances the timeline, signalling the pt */
static void *thr_inc(void *a)
{
	unsigned int v = 1;
	int last = 0;

	(void)a;
	prctl(PR_SET_NAME, "syzrepro1", 0, 0, 0);
	pin_cpu(0);
	while (wait_round(&last)) {
		g_armed = 1;
		__sync_synchronize();
		ioctl(g_tl_fd, SW_SYNC_IOC_INC, &v);
		__sync_synchronize();
		g_done1 = 1;
	}
	return NULL;
}

/* T0: closes the fence mid-signal, dropping the pt's last reference */
static void *thr_close(void *a)
{
	int last = 0;

	(void)a;
	prctl(PR_SET_NAME, "syzrepro0", 0, 0, 0);
	pin_cpu(1);
	while (wait_round(&last)) {
		while (!g_armed && !g_stop)
			__asm__ __volatile__("pause" ::: "memory");
		if (g_stop)
			break;
		spin_us(BIAS_US);
		close(g_fence_fd);
		__sync_synchronize();
		g_done0 = 1;
	}
	return NULL;
}

static int open_sw_sync(void)
{
	int fd = open(SWSYNC, O_RDWR);

	if (fd >= 0 || errno != ENOENT)
		return fd;
	mkdir("/sys/kernel/debug", 0755);
	mount("debugfs", "/sys/kernel/debug", "debugfs", 0, NULL);
	return open(SWSYNC, O_RDWR);
}

int main(void)
{
	pthread_t t0, t1;
	long i;

	close(SYSCHK(open_sw_sync()));
	pthread_create(&t1, NULL, thr_inc, NULL);
	pthread_create(&t0, NULL, thr_close, NULL);

	for (i = 0; i < 200 && !g_stop; i++) {
		struct fence_data d = { .value = 1, .name = "syzrepro_pt", .fence = -1 };
		int tl = SYSCHK(open_sw_sync()), w;

		SYSCHK(ioctl(tl, SW_SYNC_IOC_CREATE_FENCE, &d));
		g_tl_fd = tl;
		g_fence_fd = d.fence;
		g_armed = g_done0 = g_done1 = 0;
		__sync_synchronize();
		g_round = i + 1;

		for (w = 0; w < 5000 && !(g_done0 && g_done1); w++) {
			struct timespec ts = { 0, 1000000 };

			nanosleep(&ts, NULL);
		}
		close(tl);
	}

	g_stop = 1;
	__sync_synchronize();
	g_round++;
	pthread_join(t1, NULL);
	pthread_join(t0, NULL);
	return 0;
}
==================================================================

Crash log:
==================================================================
refcount_t: addition on 0; use-after-free.
WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x76/0xd0 lib/refcount.c:25, CPU#0: syzrepro1/402
Modules linked in:
CPU: 0 UID: 0 PID: 402 Comm: syzrepro1 Tainted: G             L      7.2.0-dirty #2 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:refcount_warn_saturate+0x76/0xd0 lib/refcount.c:25
Code: 3d ff e4 bb 04 67 48 0f b9 3a eb 4d 85 db 74 2f 83 fb 01 75 38 48 8d 3d f8 e4 bb 04 67 48 0f b9 3a eb 36 48 8d 3d fa e4 bb 04 <67> 48 0f b9 3a eb 28 48 8d 3d fc e4 bb 04 67 48 0f b9 3a eb 1a 48
RSP: 0018:ffff88810cd47d68 EFLAGS: 00010046
RAX: 0000000000000000 RBX: 0000000000000002 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffff9be2c840
RBP: ffff888102a5dc40 R08: ffff888102a5d73b R09: 1ffff1102054bae7
R10: dffffc0000000000 R11: ffffed102054bae8 R12: dffffc0000000000
R13: ffff888102a5d740 R14: ffff888102a5d738 R15: ffff888102a5d738
FS:  00007ae687b8f6c0(0000) GS:ffff88817d75f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000578dd65f7e58 CR3: 000000010b72c000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:-1 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 dma_fence_get include/linux/dma-fence.h:317 [inline]
 sync_timeline_signal+0x383/0x550 drivers/dma-buf/sw_sync.c:229
 sw_sync_ioctl_inc drivers/dma-buf/sw_sync.c:410 [inline]
 sw_sync_ioctl+0x140/0x980 drivers/dma-buf/sw_sync.c:475
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xb6/0x100 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7ae687c90d6b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007ae687b8edd0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ae687b8ee3c RCX: 00007ae687c90d6b
RDX: 00007ae687b8ee38 RSI: 0000000040045701 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffcdb19abc7
R10: 0000000000000000 R11: 0000000000000246 R12: ffffffffffffff80
R13: 0000000000000000 R14: 00007ffcdb19aad0 R15: 00007ae68738f000
 </TASK>
----------------
Code disassembly (best guess):
   0:	3d ff e4 bb 04       	cmp    $0x4bbe4ff,%eax
   5:	67 48 0f b9 3a       	ud1    (%edx),%rdi
   a:	eb 4d                	jmp    0x59
   c:	85 db                	test   %ebx,%ebx
   e:	74 2f                	je     0x3f
  10:	83 fb 01             	cmp    $0x1,%ebx
  13:	75 38                	jne    0x4d
  15:	48 8d 3d f8 e4 bb 04 	lea    0x4bbe4f8(%rip),%rdi        # 0x4bbe514
  1c:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  21:	eb 36                	jmp    0x59
  23:	48 8d 3d fa e4 bb 04 	lea    0x4bbe4fa(%rip),%rdi        # 0x4bbe524
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 28                	jmp    0x59
  31:	48 8d 3d fc e4 bb 04 	lea    0x4bbe4fc(%rip),%rdi        # 0x4bbe534
  38:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  3d:	eb 1a                	jmp    0x59
  3f:	48                   	rex.W
==================================================================


