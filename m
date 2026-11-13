Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559789;
	b=z2MZ6kLYOz4E0xkcuvxvZHhrj8vcRjEr/+NzXyEJu+N5h+2sf0f/izRn1XQi05gdH1df
	 NtV/cE0uk357C+bfNuvQSGewXMl8ZM3fQ6CnANZAIlr9Vj5Q6Q/sZ8eNUFtcaTcGHzYtU
	 9OTDKVRaYqZmmy9XCIV9t2Joyb5jo8G0n5OS+CoyzbCBzV9qYLA6CVQ0vmuJSU5SrKirn
	 tMsdoZ07urFHQ4JVfh7UQzLYJyskRiL2kbQBipBhOsXug8qyHSA05lkzENWBUMwLM1bCz
	 57ytJZ1MiERkjEc2vckqDyjfmPlH9Q8npE8xOG9mt0PcdbRf61UQzEv5kS8szCXreWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uYCF/j3Berl6MM/JQ+PGmzcBwIXAJx/VQr0A1zxvBKY=;
	b=3ln6WIPJsy/CgyNd+ktG9qX0VA7s+83IOr4LjJcAsVrW3EFOnUFTordOTPe3YdoPpCPx
	 l1LFrOb+WEjkOvOPQyh2Exo9Gg6hFhM1T2p82vtoS1xsTIeXKrvVQzwOydeVmLBK/Nh/H
	 ULrBmtX2MmiAt9cx0yrozwSb+ZqRQ9Mkznr64iswCxF5+hXf+pBjUfdg4QFPr30oxdMAY
	 Gkd1EJtlxyF1fqthz8tzow0xvLOMuX7BdwlwPCjk5SNgWJ4e1sTjr4z8aYQqS1ikHDp4U
	 4lL0zY6yoI5lgkBFq6kX26jTn+FoEGysRMqYYxfnDe/ybHI4Q72i9i27PBkcakhcLwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZxHKOg9;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09264606D93F
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09264606D93F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZxHKOg9
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so1153400eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559788; x=1795164588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYCF/j3Berl6MM/JQ+PGmzcBwIXAJx/VQr0A1zxvBKY=;
        b=qZxHKOg9sWmn6bGlJ4C9tduJ1fzHeH+/ZndhFC9p4jUzJb84HdEYGd0xEX/U5JKnkC
         2TTA8tkp193y+sOsHVxSdoTRrgMM+6jigdlR1n875Mnqd/e08frQUZjepA872XMqFTWP
         a38zf+Sprpr9xwIZweMvM9ua0QL9RStTZQWcGDXBXnxTcS9yVOsVM2E4+MUvrQJ672GR
         mmEOtPNeahrPUuYHew/YgXP6LVWfGVrHjJTWuh2Y7qlTbEO3Tdr29h+sUOwmqidwOHbt
         3qjQm6isMVD3u+cRlgNk4HyrSmxt4dCVfWQBOj3+dW32DMdks+LY2VytYZ3bu4MUELLS
         weiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559788; x=1795164588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYCF/j3Berl6MM/JQ+PGmzcBwIXAJx/VQr0A1zxvBKY=;
        b=VPiWHtUXjKwCP+M4fkn3oMxXjTdjoA5JS+q6dRLnJk4AcgKy4KsoT766C+bhf4sS9b
         F14ART5VlTyolkTnEPGf4rSWZf/8ThGmM3VkQdjcBxCRnMtKlAu3OVvEqbTrLY5ZEhRs
         E651vWUM1A7RE9sGb2h6Ma+uqGrnYCmnS3qHq0fwALOj/Ft+UhL4U1VMlLKx/RFGWaZ+
         NKWrsXp98FFVYO1HfJm5hpevKswxen8d7ekQk5VT2DmtiZLhq3IaTXz83jcpEl41phaX
         4xgWeRfUNELw3JuKPfuwSPwt7REN5ZWGszvEEeUBK7fCjkOsIi4fBJsa8trufSav3GD0
         EnOg==
X-Forwarded-Encrypted: i=1; AL+hErFwPFDxrGWZK8JNJp/bLWM8frIXjnka6sSOKUAfKg0kIokJBZ/piHCI1U2Dtn/sBnhv9OFEHpPLTmbgoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8oLDNFxp4KcNsics5UADXHQ/YPrc/kPPOul+n8vM0r0b/s+bx4
	4GbZ2AC4I+tJzNTvRNlspCts8NG5uWgIlMWzCTNC4aMwLA9r+o8X+H0i
X-Gm-Gg: AYBFou3IYAhsDAPaUZiaytLSA53aLwxdG2NN6w7WwHNZ+7WeJiAgQID1x1+Homxg0h/
	jt1VkmshwjuRtAQFcoenzCqKzOaUVv5nd0Th1WVgvbwiYZuoxpQ/vp5L/YULvIVhg/l1rcZUvrk
	zeIJnMpKjhc5s7gKiNrTRcG2JIxzS1JngPn/FgBpWgWkWehSet/KccUTuj/KuS4p94wN/sz2Dgv
	KoExhlzeAAjLiM1PgHk/UhxtcFttAsXu9ralzkaGkwa4bk6SJxkdtjqx15o2d3Ougk4SAjQso8k
	/QfIB74ffooOuLdajUE/yURFlMvjbTjoFddeySI/J3d8VzW2uPSFw8xfnNiqtC3SM4O+LZKLUZm
	QmJAWPPOCLrbCruIgghvIBh+fTxL/yBpmm0XfzOD9ojQQHKFrEaAL4rO+WtGt9Z0htvvLMKJ3E7
	IGl/HpzP0MJkkbN/ZRXqr6oQRQO98aCU9aJdjaeFSinmjADPrWijkT4rfyoft7bK2Cue8TSfc8O
	rKwoin9r8XX+c9LFqBKrnWl1oIZXnGLTv/4BLyUI9qqZuslULtPhZ1lJCnGyIUasrZz8l6Fllyp
	7mHC97Wl6In4jcxgXTspbGkQauOSflxj3xqaylERo+vtrtkcrqq9WpW146GwM7atYr9gESUXZpX
	wQLOe83wHDCkpRDJmYwD5/3Zad//XD/jM7bHe5YVnlbY=
X-Received: by 2002:a05:7300:fb8c:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3796676a1e8mr2333338eec.16.1794559787921;
        Fri, 13 Nov 2026 00:49:47 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:1866])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm5387695eec.12.2026.11.13.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:47 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil@kernel.org,
	nicolas.dufresne@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: v4l2-mem2mem: wait for job-finish scheduling before freeing a context
Date: Fri, 13 Nov 2026 16:49:40 +0800
Message-Id: <20261113084940.211907-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When vicodec finishes a job, it calls v4l2_m2m_job_finish(). This clears
TRANS_RUNNING, but the function still uses the context afterwards to
schedule the next job. If another thread closes the file or stops
streaming at that point, v4l2_m2m_cancel_job() can see the job as no
longer running and return; the context may then be freed while the
scheduling code is still using it.

I reproduced this with vicodec by delaying the scheduling path after the
running flag was cleared. The unpatched kernel reported a KASAN
use-after-free in the scheduling tail.

Keep a count of scheduling tails that are still using each context.
Update the count under job_spinlock and make cancellation wait until both
the running job and all scheduling tails have finished. This keeps the
context alive until the last user of it is done.

The count also handles two jobs finishing close together: the first tail
cannot make the context look idle to a waiter while the second tail is
still registered. The wait condition is checked under the same lock that
protects the count, so the last tail does not wake a waiter before it has
finished with the context.

Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
Cc: stable@vger.kernel.org
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes since v1:
- Replace the completion with a count of active scheduling tails.
  The count is updated under job_spinlock and cancellation waits
  until it reaches zero.
- Simplify the comments to explain why the context must remain
  alive after TRANS_RUNNING is cleared.
- Reproduce overlapping tails with vicodec and targeted injection.
  A test-only release call entered cancellation with two tails
  active and returned after both had completed. This was not a
  userspace close test.

AI tools assisted with source review, test harness development, and
drafting the commit message and source comments. The author reviewed the
resulting code, comments and test results.

v1: https://lore.kernel.org/r/179378462223.70003.3811321311940400468@gmail.com/

 drivers/media/v4l2-core/v4l2-mem2mem.c | 44 ++++++++++++++++++++++++--
 include/media/v4l2-mem2mem.h           |  5 +++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..62c4ab542b58a 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -404,6 +404,21 @@ static void v4l2_m2m_device_run_work(struct work_struct *work)
 	v4l2_m2m_try_run(m2m_dev);
 }
 
+/* A context is idle only when its job and scheduling tails are done. */
+static bool v4l2_m2m_ctx_idle(struct v4l2_m2m_ctx *m2m_ctx)
+{
+	struct v4l2_m2m_dev *m2m_dev = m2m_ctx->m2m_dev;
+	unsigned long flags;
+	bool idle;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	idle = !(m2m_ctx->job_flags & TRANS_RUNNING) &&
+	       !m2m_ctx->sched_tail_active;
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	return idle;
+}
+
 /**
  * v4l2_m2m_cancel_job() - cancel pending jobs for the context
  * @m2m_ctx: m2m context with jobs to be canceled
@@ -427,8 +442,6 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 		if (m2m_dev->m2m_ops->job_abort)
 			m2m_dev->m2m_ops->job_abort(m2m_ctx->priv);
 		dprintk("m2m_ctx %p running, will wait to complete\n", m2m_ctx);
-		wait_event(m2m_ctx->finished,
-				!(m2m_ctx->job_flags & TRANS_RUNNING));
 	} else if (m2m_ctx->job_flags & TRANS_QUEUED) {
 		list_del(&m2m_ctx->queue);
 		m2m_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
@@ -439,6 +452,17 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 		/* Do nothing, was not on queue/running */
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 	}
+
+	/*
+	 * Wait for the running job, if any, and its scheduling tail.
+	 * TRANS_ABORT prevents new jobs from being queued.  A job that
+	 * was already running may still finish and register its tail;
+	 * the idle check covers both states.
+	 *
+	 * As with the original cancellation path, progress depends on
+	 * the active job eventually completing or being aborted.
+	 */
+	wait_event(m2m_ctx->finished, v4l2_m2m_ctx_idle(m2m_ctx));
 }
 
 /*
@@ -453,6 +477,8 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 	 * allow more than one job on the job_queue per instance, each has
 	 * to be scheduled separately after the previous one finishes.
 	 */
+	unsigned long flags;
+
 	__v4l2_m2m_try_queue(m2m_dev, m2m_ctx);
 
 	/*
@@ -460,6 +486,15 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 	 * but the job must be run in non-atomic context.
 	 */
 	schedule_work(&m2m_dev->job_work);
+
+	/*
+	 * The scheduling tail is done with this context.
+	 * Wake any thread waiting to close it.
+	 */
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	m2m_ctx->sched_tail_active--;
+	wake_up_all(&m2m_ctx->finished);
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 }
 
 /*
@@ -475,6 +510,11 @@ static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	}
 
 	list_del(&m2m_dev->curr_ctx->queue);
+	/*
+	 * The scheduling code still uses this context after TRANS_RUNNING
+	 * is cleared. Keep it alive until that code has finished.
+	 */
+	m2m_dev->curr_ctx->sched_tail_active++;
 	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
 	wake_up(&m2m_dev->curr_ctx->finished);
 	m2m_dev->curr_ctx = NULL;
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b98..e9f390aff3664 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -97,6 +97,10 @@ struct v4l2_m2m_queue_ctx {
  * @job_flags: Job queue flags, used internally by v4l2-mem2mem.c:
  *		%TRANS_QUEUED, %TRANS_RUNNING and %TRANS_ABORT.
  * @finished: Wait queue used to signalize when a job queue finished.
+ * @sched_tail_active: Number of in-flight job-finish scheduling tails for
+ *		this context, protected by the device job spinlock.
+ *		v4l2_m2m_cancel_job() waits for it to drop to zero before the
+ *		context can be released.
  * @priv: Instance private data
  *
  * The memory to memory context is specific to a file handle, NOT to e.g.
@@ -125,6 +129,7 @@ struct v4l2_m2m_ctx {
 	struct list_head		queue;
 	unsigned long			job_flags;
 	wait_queue_head_t		finished;
+	unsigned int			sched_tail_active;
 
 	void				*priv;
 };
-- 
2.34.1

