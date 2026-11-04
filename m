Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784641;
	b=Nq2kqT2Rp+IK+LoJNRzdEhnTP9gCTasINFgdjpfhD4SKNVI7P9FlkVW/bPUFe2uMWoP3
	 Wa66YNzxFuUx2/RLFTuARpwuMNhzGVytoQonHGBIhWIaKoE/QLpuAOr25+921v2141RN2
	 CG/gt1ezIaywN661zUjbbEv7JvQGkqYDUEf/rrT+VcvU2dpdmL9063nWeqzboBzG256us
	 AD7mmz8BPkyLQn/kOW/wLj3tGYT+ba2MKULXaDRiVCZOUxc3r56n9LnE25+913fpULjUz
	 W9ciUS7gFbDE5rc3vaM/xtVkrXmv79Yr1eogkNDuO6EygXQXoiyJnQ0QTJsBSdtCNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=TNqBnIapzJjAfwRgHqXenkycVjQfCh4gehzS433iHnc=;
	b=BHo6A5BNKfOzkxCUuaQwbSkqax+XlFQVe99oCpHrVF2y2/hxGy1TyNpDqp71HkBvXNPS
	 sF3MQb/Y3/lP2o5X0vDJ0jZKpmWgeJXK0BjIVX+Sw4S6pEr9vs/lTNCfFnTzOx73PratW
	 1uYp7BaGZfaYwU7NrXIbzO6fyssX9+qNztYAUfANgXA8HZYUeelleOBSa81XKlIb0LHKJ
	 5LzjeDzeZa5xsrL/N6fvXjr1wGXZYeK6TNaprpOmPF8khP2H9/Kjup0lwMo+V0sYect9I
	 XojrnqBw8tAjf+F8zih8o1IXcLm1RQn6XG6/kiak+OhhE6RXM/OFq1Vc71GPy1ZAyTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JefbuDH;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE6B606A326
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 09:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0JefbuDH
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058f74a54so166123b3a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 01:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784640; x=1794389440; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNqBnIapzJjAfwRgHqXenkycVjQfCh4gehzS433iHnc=;
        b=0JefbuDHERZRP7xP8TRinKu6X8xQf3vPYYx84GG5FFvy4Qc6nuQtpVdjvFue/UCSJG
         1gBso0GLP70pEG0K1vO169WFr+TvKOvT29JdNKseB65ThhLVzrBfj0/mBsdf5fktv9h0
         17SQBxtbLCkLWOG4vlmC+5tRjP6F+dsYRWY9keglWmb1e9ZJMxri9yAC7wn6KkJLEDYL
         2d/DZqs/IRy/M+K7wM6tHpAkaB2E1DkM8CB39Ug3ZuCzxUpuWrX2/zLuaJ8uOPFABk8x
         TK8HHQfDurd3VnbJPTVUsg/kZoi/gmPYMuxuxXnk8JPsA+SCGXr0HysSJ6Nk3kSX2nt7
         TuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784640; x=1794389440;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNqBnIapzJjAfwRgHqXenkycVjQfCh4gehzS433iHnc=;
        b=v6uNEXdjFA9voUSWp9CLKaH6JQ5hH78q1MDrqhLZlYferFCs3QWHzm1jtHwOqUt2PC
         Dcn6n4RRXQusogQULJIhAzvNi96oQbXnRFofDGzm+RdgiUKvbwmZvpVR4fNXHaoEtVIn
         YIXb/YZL5Zl0TMY7eQHGK31UDAYLLT8rQUxlmvnkS3c0Iaa0kHvhtCpGN4Oigi60yweh
         g+rSC2blo0LVX2DMGb61e7LdFDQGqO1CSSTGaUP81DlLW8Y49kHw6f3oE8mQFUrkFvJA
         j6Fj1hES+vsEXNrKr3/zI3u2Q2fKalb4Km3xeLzSmXUL0G9ZdajnPI/pnIpTMLAsROb+
         JNiw==
X-Forwarded-Encrypted: i=1; AKwUvBwzz5N9q9EW0T59hQgfQ83ItFNe2otUq9h4kVli4suiiVrG8JtTVf9hTlxUaDYpJt3Ga4PeQPpWIVCohg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/pHn8/alFlCxLaIeNYEE/7dvg6+RTlzMHbWVaT9cLQdw+eHlMr
	WFpOhTTGubcqTCB9fqRGS5kluTEnlwawckF3V4D4eTxXT0UintdLAlWm
X-Gm-Gg: AYBFou1MNtMfPgaTp9N9fLFg3rhaXoyMZJb/FYWgL4uHN4y+8gCo5Xw319XU3ZATuQr
	j+RcKWbqRiiPrNOYzJ8Jg3I38KfhtVLnBCA/EboApABKOHIXBMY994TN+u/NV503U0+odpfGEVl
	00K2VXD2c8LX3DMzK/xek/gYQiovkIFxb46sO/jS+PH7CQlxEtWvsUfzEYuK0tZxjmJsoLzzH8A
	mwBtpUTezbXXandCyQuF4p84tEFhyvHo0bnizLUEzF/GjY+H8JJemprAuAbup2O+9xUpBS43uMV
	qZp2C6Nfs/qSLk3bgy0rERspK7+G5bXnJZU8zKgruLVXKeHOzsQjBY7j+lyI+5Igd2f68tfMT/+
	pwtUpxQNT600nZk8rcPmOki7SiBadWDbfZbBmROi9WfxtVOplHGMjDkP2VOcJfjUSxdoSsbf4Lc
	JVT61vUWlxKfHWfQ2pbFHBgAqCrRf1Emw6VzbMjIsHq5vYmsoI2txoCctE98XNaP2PY+MFEVrOr
	nrY3o+nnbP4/7nMAuKvmoallrLuxXNFUiWlTnMXf0npmbxxnEWR9B56SRvbFz/fQPLkGc2JqgwF
	NyBcBwNqmw2Q5VDAujRfSmgRnjOQMGYVAm6scYb3dAGI0LRT4Nk52YmcIeQADnmQY94=
X-Received: by 2002:a05:6a00:4b4f:b0:8a0:7c97:52a1 with SMTP id d2e1a72fcca58-8a9bffd5de5mr13214765b3a.48.1793784639737;
        Wed, 04 Nov 2026 01:30:39 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b5698a2sm690547b3a.35.2026.11.04.01.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:30:39 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:30:22 +0800
Subject: [PATCH] media: v4l2-mem2mem: wait for the job-finish scheduling tail
Message-ID: <179378462223.70003.3811321311940400468@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, Frank.Li@nxp.com, ming.qian@oss.nxp.com,
 nicolas.dufresne@collabora.com, dmantipov@yandex.ru, 121811682@qq.com,
 ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

The job-finish path clears TRANS_RUNNING and TRANS_QUEUED before its
follow-up scheduling tail has finished using the mem2mem context.
If release races with that tail, v4l2_m2m_cancel_job() can observe no
running or queued job and allow the context to be freed while the tail
still accesses it.

Track the scheduling tail with a completion and wait for it in the
cancellation path. Start the completion in the done state so contexts
that never ran a job do not wait indefinitely, reinitialize it when a
scheduling tail begins, and complete it after the tail finishes.

The original race was reproduced as a KASAN use-after-free in the
common mem2mem code using the in-tree vicodec test driver and targeted
timing injection.

Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 27 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..7637a876bb8c3 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -439,6 +439,13 @@ static void v4l2_m2m_cancel_job(struct v4l2_m2m_ctx *m2m_ctx)
 		/* Do nothing, was not on queue/running */
 		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 	}
+
+	/*
+	 * A job-finish tail may still walk this instance after
+	 * TRANS_RUNNING was cleared; wait for it to finish so the caller
+	 * can safely release the instance.
+	 */
+	wait_for_completion(&m2m_ctx->scheduling_done);
 }
 
 /*
@@ -460,6 +467,14 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_m2m_dev *m2m_dev,
 	 * but the job must be run in non-atomic context.
 	 */
 	schedule_work(&m2m_dev->job_work);
+
+	/*
+	 * Signal that the scheduling tail is done. complete_all is
+	 * atomic: once called, all current and future waiters are
+	 * released, with no lock-free condition window as with
+	 * wait_event() + a flag bit.
+	 */
+	complete_all(&m2m_ctx->scheduling_done);
 }
 
 /*
@@ -476,7 +491,14 @@ static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 
 	list_del(&m2m_dev->curr_ctx->queue);
 	m2m_dev->curr_ctx->job_flags &= ~(TRANS_QUEUED | TRANS_RUNNING);
+	/*
+	 * The follow-up scheduling of the same instance still walks it
+	 * after the lock is dropped; re-arm the completion so that
+	 * v4l2_m2m_cancel_job() waits for the tail to finish before
+	 * releasing the instance.
+	 */
 	wake_up(&m2m_dev->curr_ctx->finished);
+	reinit_completion(&m2m_dev->curr_ctx->scheduling_done);
 	m2m_dev->curr_ctx = NULL;
 	return true;
 }
@@ -1245,6 +1267,11 @@ struct v4l2_m2m_ctx *v4l2_m2m_ctx_init(struct v4l2_m2m_dev *m2m_dev,
 	m2m_ctx->priv = drv_priv;
 	m2m_ctx->m2m_dev = m2m_dev;
 	init_waitqueue_head(&m2m_ctx->finished);
+	init_completion(&m2m_ctx->scheduling_done);
+	/* Start as done: a context that never runs a job must not block
+	 * in v4l2_m2m_cancel_job(). reinit_completion() below re-arms it
+	 * each time a scheduling tail actually starts. */
+	complete_all(&m2m_ctx->scheduling_done);
 
 	out_q_ctx = &m2m_ctx->out_q_ctx;
 	cap_q_ctx = &m2m_ctx->cap_q_ctx;
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b98..89c8f10de67c7 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -95,7 +95,7 @@ struct v4l2_m2m_queue_ctx {
  * @out_q_ctx: Output (input from memory) queue context
  * @queue: List of memory to memory contexts
  * @job_flags: Job queue flags, used internally by v4l2-mem2mem.c:
- *		%TRANS_QUEUED, %TRANS_RUNNING and %TRANS_ABORT.
+ *		%TRANS_QUEUED, %TRANS_RUNNING, %TRANS_ABORT and %TRANS_SCHEDULING.
  * @finished: Wait queue used to signalize when a job queue finished.
  * @priv: Instance private data
  *
@@ -125,6 +125,7 @@ struct v4l2_m2m_ctx {
 	struct list_head		queue;
 	unsigned long			job_flags;
 	wait_queue_head_t		finished;
+	struct completion		scheduling_done;
 
 	void				*priv;
 };
-- 
2.34.1

