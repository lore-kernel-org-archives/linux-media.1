Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09333B97B
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 14:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582924; cv=none; b=hW+95g3D3D9XdNVdft1W/FDFStgp1eaE0KBDhAYQsldO0TyKXupm745B/4C3at42o//g/Wvqar0LRcKBM34A/Zm2FntqpdTPkTFPLIuW2NS0QL7y+AY6flErl0JN0cqUrFM7UJGl7zESX8kDi0gXXYyB80OpLvqUGxpTGiTwcP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582924; c=relaxed/simple;
	bh=zgYb0g4/ZbLj1nEz72O4c+y3pPFdMyaiVYTduwIGTqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFacSzRsf0VZZyohCp10ucGlujJZ9HmT2VJSkQ6O9lJXs9wwqRP14ibBM2nJRYhyiF2is+lcBVghIFJzvcsfp4mfaYvFZeJDenBzir/tr47PQ0BZvLpqhJgvGoJg78NchK8Z2J/uujDA9lNPHnTT6igGP5KP94uJh5w64zZX9os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=giU8a8OJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="giU8a8OJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84830c774a0so4011546b3a.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 07:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787582919; x=1788187719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDBeWDp+XbPr7ncXEFfJAA0Z5cw3Q1kxIg2N5z42Wsw=;
        b=giU8a8OJ342d8L01ZbRGXY6XkQsQULP0nYWjtgrOqpt2o85XDPPrgwlhGGmVpLnnG1
         s26BIiUOr1SCqjEYNyaC/S8QukazFwI8aZZGtV7f/9XkHMwuee30VBPHusME/kZz37mL
         GjpAHmmv+bNOjguySTnFjO8kdU8TfLKeKeVCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582919; x=1788187719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pDBeWDp+XbPr7ncXEFfJAA0Z5cw3Q1kxIg2N5z42Wsw=;
        b=TTpdN1jG1xyImhzfrBqOuO3jq00iLzCH1lgkVOEdwnv/UNprRol1JL0A2ZYtWPoLfl
         ObjQaXlaL12hi71j4gQkrMUMxqrgsMg77qmAJxOY0IR6TYdmotvSQK0Z56QIJ+i+SJyF
         /Xyxm6JEpQmL4VHO5EeiKDhiTYkUg9El9x2FPRm/3/HJ747bQZKl9Y0dsmxQ5HSbhHKf
         j+j299uYqIrgj1otougLNtgP8WyVipW9UXvI/xhQi1XPjwwdU5A/aKAHxFdLlPaeLQG0
         haSBUMcfXiDD/DxYzqiC/riKxTGdK4qLj18CcBLsluwkvcKQRZZ9vN8IwWRsHVVm2FBV
         C2ag==
X-Gm-Message-State: AFuF++muuN+sXYTIutqqSGwcOlAjTUyLWreniIk1vrMiNAwSC2wpofwI
	zxTVaEQ7Ob3jSwAw/FBv0cfksKi1S/EJ2Sj+Go8oYewCUNFFWbHriWXot56vV1qjN9ax+YW1WO/
	haXA145A=
X-Gm-Gg: AR+sD13SUsVwqbKjbcpqoUzl6AUGi3oHPWb8ywRUEAf/3MfoLnuEhQVOmTTdRr/t6ci
	/bNtpgAH6K6j01o0Dm5Ne9Fuh1Q5yiDo5WM25BM4hatgZdyGwYNQU0OBWRKA9AP30YfkkRBgI75
	ezM+z37OF1VisGp88wUCTRrHIRW+XCpfkRpaZwdZZ1EikLPTcykDRZBjlVvYlbhS1cXZ/Vo2STy
	DGBnhbKzN9S09XXET+VFoSOkLAXsJdDhOJLTYWSQmMpirWHTiAgHjIrqwrvjFdfbl79gApHiWUD
	SmvH6xp9YUkLeQ+ke/KP2DZZAGXvY9syWHZqBjrmQ6+i7dphMutg3CIJe+4/5V/GY/BXxcPTORM
	pLjjvj1XnroXobS+kuxIsNPZZy8oVXavVQAv2T12khD8ytvzLAl0HfBhQZygfbaSS918Jd5Z9mg
	TSAFbAOCFJ7bX+sLvTdhIGDkQd5VjSKWXouGZbUBO0d9jO7kMv2byrKZMPLkXXTj+TbnhlFLTbT
	bPZ6DYHxFMuRNFAvSKS/LVFs70EMkjP7hOtvt/25DQHObSjJ5Xw/aNIBo8e7DwJV2YsJSOjmpkU
	1TwgDLpJSbFZ+vRQ6aIP6n09bTHXohORy3IuA3tuv3A1YCa8S+EYpg==
X-Received: by 2002:a05:6a00:6ca2:b0:845:e7ee:eae7 with SMTP id d2e1a72fcca58-851f9a2f1edmr49018886b3a.5.1787582919100;
        Mon, 24 Aug 2026 07:48:39 -0700 (PDT)
Received: from leesin ([147.46.121.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef0911bsm2084283b3a.14.2026.08.24.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:48:38 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	eulgyukim@snu.ac.kr,
	jjy600901@snu.ac.kr
Subject: [BUG] WARNING: refcount bug in dvb_device_open
Date: Mon, 24 Aug 2026 23:48:08 +0900
Message-ID: <20260824144832.2135903-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

We found a "WARNING: refcount bug in dvb_device_open" on Linux v7.2.
The issue was found by our own race fuzzer. We have not analyzed the root cause,
so we do not have a proposed fix to offer.

To reproduce the race reliably, we applied the delay patch below to the
kernel and ran the C reproducer as root inside an x86_64 QEMU guest. The
crash log we observed, the delay patch and the reproducer are all included
below.

The following kernel config options are required to reproduce the issue:
    CONFIG_MEDIA_SUPPORT=y
    CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
    CONFIG_DVB_CORE=y
    CONFIG_DVB_VIDTV=y
    # CONFIG_DVB_DYNAMIC_MINORS is not set
    CONFIG_DVB_TEST_DRIVERS=y
    CONFIG_KASAN=y

We hope this report is useful. Please let us know if any further
information would help.

Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>

Kernel delay patch:
==================================================================
--- a/drivers/media/dvb-core/dvbdev.c	2026-08-21 00:29:05.580120458 +0900
+++ b/drivers/media/dvb-core/dvbdev.c	2026-08-21 00:29:05.652121379 +0900
@@ -21,6 +21,8 @@
 #include <linux/fs.h>
 #include <linux/cdev.h>
 #include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/sched.h>
 #include <media/dvbdev.h>
 
 /* Due to enum tuner_pad_index */
@@ -105,6 +111,9 @@
 			goto fail;
 		file->private_data = dvb_device_get(dvbdev);
 		replace_fops(file, new_fops);
+		if (strncmp(current->comm, "syzrepro1", 9) == 0) {
+			mdelay(20);
+		}
 		if (file->f_op->open)
 			err = file->f_op->open(inode, file);
 		up_read(&minor_rwsem);
@@ -613,6 +625,9 @@
 {
 	struct dvb_device *dvbdev = container_of(ref, struct dvb_device, ref);
 
+	if (strncmp(current->comm, "syzrepro", 8) == 0) {
+		mdelay(60);
+	}
 	kfree(dvbdev);
 }
 
==================================================================

C reproducer:
==================================================================
#define _GNU_SOURCE
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/sysmacros.h>
#include <unistd.h>

#define SYSCHK(x) ({ long __r = (long)(x); if (__r == -1L) { perror(#x); exit(1); } __r; })

#define DVB_MAJOR 212
#define FE_MINOR(a, id) (((a) << 6) | ((id) << 4) | 3)

struct k_sigevent {
	uint64_t sigev_value;
	int sigev_signo, sigev_notify, sigev_tid, _pad[12];
};

static char g_path[256];
static pid_t g_pid;
static volatile pid_t g_t1;
static volatile int g_stop;

static int usable(const char *p)
{
	int fd = open(p, O_RDONLY | O_NONBLOCK);

	if (fd >= 0) {
		close(fd);
		return 1;
	}
	return errno == EBUSY;
}

static int find_frontend(void)
{
	int a, id;

	for (a = 0; a < 4; a++) {
		for (id = 0; id < 4; id++) {
			snprintf(g_path, sizeof(g_path),
				 "/dev/dvb/adapter%d/frontend%d", a, id);
			if (usable(g_path))
				return 0;
			snprintf(g_path, sizeof(g_path), "/tmp/fe%d", FE_MINOR(a, id));
			unlink(g_path);
			if (mknod(g_path, S_IFCHR | 0600,
				  makedev(DVB_MAJOR, FE_MINOR(a, id))) == 0 && usable(g_path))
				return 0;
			unlink(g_path);
		}
	}
	return -1;
}

static void noop(int sig) { (void)sig; }

static void *opener(void *a)
{
	(void)a;
	prctl(PR_SET_NAME, "syzrepro0", 0, 0, 0);
	while (!g_stop) {
		int fd = open(g_path, O_RDONLY | O_NONBLOCK);

		if (fd >= 0)
			close(fd);
	}
	return NULL;
}

/* T1: takes a signal inside dvb_device_open(), unwinding the open midway */
static void *victim(void *a)
{
	struct k_sigevent sev = { .sigev_signo = SIGUSR1, .sigev_notify = 4 };
	struct itimerspec its = { { 0, 3000000 }, { 0, 3000000 } };
	int timerid = 0;
	long i;

	(void)a;
	prctl(PR_SET_NAME, "syzrepro1", 0, 0, 0);
	g_t1 = sev.sigev_tid = syscall(__NR_gettid);
	if (syscall(__NR_timer_create, CLOCK_MONOTONIC, &sev, &timerid) == 0)
		syscall(__NR_timer_settime, timerid, 0, &its, NULL);

	for (i = 0; i < 40 && !g_stop; i++) {
		int fd = open(g_path, O_RDWR | O_NOATIME);

		if (fd >= 0)
			close(fd);
	}
	g_stop = 1;
	return NULL;
}

static void *signaller(void *a)
{
	(void)a;
	prctl(PR_SET_NAME, "syzrepro2", 0, 0, 0);
	while (!g_stop) {
		if (g_t1)
			syscall(__NR_tgkill, g_pid, g_t1, SIGUSR1);
		usleep(300);
	}
	return NULL;
}

int main(void)
{
	struct sigaction sa = { .sa_handler = noop };
	pthread_t a, b, c;

	prctl(PR_SET_NAME, "syzrepro3", 0, 0, 0);
	g_pid = getpid();
	if (find_frontend() != 0) {
		fprintf(stderr, "no dvb frontend\n");
		return 1;
	}
	SYSCHK(sigaction(SIGUSR1, &sa, NULL));
	pthread_create(&b, NULL, victim, NULL);
	pthread_create(&c, NULL, signaller, NULL);
	pthread_create(&a, NULL, opener, NULL);
	pthread_join(b, NULL);
	g_stop = 1;
	pthread_join(c, NULL);
	pthread_join(a, NULL);
	return 0;
}
==================================================================

Crash log:
==================================================================
refcount_t: addition on 0; use-after-free.
WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x76/0xd0 lib/refcount.c:25, CPU#2: syzrepro0/411
Modules linked in:
CPU: 2 UID: 0 PID: 411 Comm: syzrepro0 Not tainted 7.2.0-dirty #3 PREEMPT 
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:refcount_warn_saturate+0x76/0xd0 lib/refcount.c:25
Code: 3d ff af bd 04 67 48 0f b9 3a eb 4d 85 db 74 2f 83 fb 01 75 38 48 8d 3d f8 af bd 04 67 48 0f b9 3a eb 36 48 8d 3d fa af bd 04 <67> 48 0f b9 3a eb 28 48 8d 3d fc af bd 04 67 48 0f b9 3a eb 1a 48
RSP: 0018:ffff88810ab6f9e8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000002 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffffffffbce53340
RBP: 00000000ffffffed R08: ffff88810344ff13 R09: 1ffff11020689fe2
R10: dffffc0000000000 R11: ffffed1020689fe3 R12: ffff88810344ff10
R13: ffff88810409a000 R14: ffff88810344ff10 R15: dffffc0000000000
FS:  00007fb58863a6c0(0000) GS:ffff888153bf7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb588639f78 CR3: 000000010afa4000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 __refcount_add drivers/media/dvb-core/dvbdev.c:-1 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 dvb_device_get drivers/media/dvb-core/dvbdev.c:629 [inline]
 dvb_device_open+0x340/0x370 drivers/media/dvb-core/dvbdev.c:108
 chrdev_open+0x3b8/0x490 fs/char_dev.c:411
 do_dentry_open+0x3f0/0x1120 fs/open.c:947
 vfs_open+0x38/0x2b0 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x21a0/0x29b0 fs/namei.c:4863
 do_file_open+0x19d/0x360 fs/namei.c:4892
 do_sys_openat2+0x9a/0x100 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0xf8/0x130 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf7/0x370 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7fb589738090
Code: 48 89 44 24 20 75 93 44 89 54 24 0c e8 a9 d7 f8 ff 44 8b 54 24 0c 89 da 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 fc d7 f8 ff 8b 44
RSP: 002b:00007fb588639e50 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000800 RCX: 00007fb589738090
RDX: 0000000000000800 RSI: 00005c341bf5c060 RDI: 00000000ffffff9c
RBP: 00005c341bf5c060 R08: 0000000000000000 R09: 00007ffece858747
R10: 0000000000000000 R11: 0000000000000293 R12: ffffffffffffff80
R13: 0000000000000000 R14: 00007ffece858650 R15: 00007fb587e3a000
 </TASK>
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	3d ff af bd 04       	cmp    $0x4bdafff,%eax
   5:	67 48 0f b9 3a       	ud1    (%edx),%rdi
   a:	eb 4d                	jmp    0x59
   c:	85 db                	test   %ebx,%ebx
   e:	74 2f                	je     0x3f
  10:	83 fb 01             	cmp    $0x1,%ebx
  13:	75 38                	jne    0x4d
  15:	48 8d 3d f8 af bd 04 	lea    0x4bdaff8(%rip),%rdi        # 0x4bdb014
  1c:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  21:	eb 36                	jmp    0x59
  23:	48 8d 3d fa af bd 04 	lea    0x4bdaffa(%rip),%rdi        # 0x4bdb024
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 28                	jmp    0x59
  31:	48 8d 3d fc af bd 04 	lea    0x4bdaffc(%rip),%rdi        # 0x4bdb034
  38:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  3d:	eb 1a                	jmp    0x59
  3f:	48                   	rex.W
==================================================================


