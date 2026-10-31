Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478421;
	b=4qrbTHQ7OgrOA8uAg48eP8hfrfi649iPmlYOT6cX92TQnCwhOr9Rb3VZ/Hcb6ygk6PBH
	 Na3g7nbmmuwTzDLl9x6t3loHUjIypOPmOY3zjjP4Wui9/lhZUuMGdeUpl3S8McAnjCTVH
	 LqeF/wHosuxcjXJWh+w/Xbu47JyVAsAK4ywNbz4S16EQHGUphiqhacRP8EA7QkjUd7JM3
	 Q7L1lFmj+d6xYDJPZIkkDqw+5Fa2B/ne1Yjd4PLGPPDbOiX1QZUnIZJqwcTwFqj51GaFz
	 uAtwDgrC3wIyWVqFNxnZd//p31rKDw4Xf6lVv8O9DVoXJ+TLvDK3Syue4jbjlDw2SYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
	b=BznYho64ziYh3/OqNBCYeaYF3khiQXxQ4H36yejnpAYBezwHtDT3MMcALlLPd0n2Cs47
	 JzyDax42ziLngqjEL6ZZbcRdjKFMV8Sg3Rp0C+89o05+SFkb9S5cb849bXjZ1QczQBWEZ
	 vi5rkW/QjpM+fpq7+27XW6jFZ4+GrAgGQn5Gx6F5BxaxPQ4X8HBwk2djl9bBtX/D9QZ8s
	 wUZWa2ZM8nQtHGE05EZpTd/LdIpzyAh6rTROwTwjLXvKDiS8OdHPLkv1QbUWLKxZbJjA9
	 OxQp+lLXVtCh3ARS3rXuhR8kCTASqT7PZH2M5vCjaOEa5M9uiO196ZMzvaiM2jBI9oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpQhYkHc;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66046606A31C
	for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 20:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66046606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YpQhYkHc
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1099677c88.0
        for <linux-media@vger.kernel.org>; Sat, 31 Oct 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793478419; x=1794083219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=YpQhYkHcvMezUVrsCJt+POW0qMKRK2IAyrGI8CMaeBiXmpObZI3xUHi4lKo2KtdmwX
         Tt69uwKDvF65tSkbhPHPDlw8pJOdZFcQ6RVtFugWe1yEVQay0q7jsaR6r4xzhSyLg03i
         U8/R15JE96xUTIe90uGpZgytXZSOwBnP2vwnnM67frdWYhSkk8Tm4icqmZQsBJEJrjOV
         7wCxSKOYzCC7JUrHeGhzYpFp1OMLxCyrWbOokdYYZbwBSLKl5tHncIGdtFEBa1njncot
         V5Uegr2DxxB/JEEdd+Qj21Hzq/YLnuF/NAQ442GngY0dr6IpumVkEhTMxviTOaE3M9W+
         wDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478419; x=1794083219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fkzFlhskYVLezmC5cyEV4VuxjdTetmArNG2q7mDGVs=;
        b=bggOVwj85SAVyTVaiD5qVyE1x1Fuy8TP3E6fGFv7F72ZInQlg3VZR3W0qoa7oKJrh4
         9uHescqYQOVI1dIv4qp3Z5VoXdReEU56Dice+H8Z8aaLvtzOBnJE7RGtjieLhiZabTa+
         mA3U0f3buwtvT4QH7ismoi8FncKPe6wKLqZJQQjvik0Iwg31g6Dqaio6Vrfp2O39jDlq
         7z7TZCMCZyNd7W1dv3ygglpYEHUpD8ZxS/3NZe2z0bO34vC2CxQzgLmR+cXD4xGaC+ym
         7Of4XcKzq9oeZ94ufxQJ0GkJ0t5d7haJ0o6to0dbsnDLoPFfsWk6gosL9KrI2dg6I8lp
         2+gA==
X-Forwarded-Encrypted: i=1; AKwUvBxD5MZLmAQlVi7m9SJCmgRgUSOTkUIvoZfbspIAfzKTJ3MdgU/A5gIhdM2S3DUgV2i6XHkqQ439x1/7Kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKXGrnhVyhmeBxjjvU+7UkmVvDIfKnipD3FjPcuHGz9VRuPdRBZ
	r3AnX7QbKMIOm+NDGo97zW1J1y9Gm6ovJZ1Puf5oxAS4XheO7jYCEgac
X-Gm-Gg: AYBFou3MbkPCFojI1XFd7152RY0iPtZhfsI+DEjGH0Lk7t332unXQtBJwN9O5iJYN54
	dF6nJ8Jt2ivyqpnuI0kydCkTr0QK6QiHoyFgi4gf2XdDTuRTrbj/dPpQ+FYPY7aiX5BVwMz0QLw
	G7B0O7uRVBh7827jSJhudGwo/lNKIHGk6nmdp+QLbjLbNLLUm6HM29qdoz9AvUdGd4JDGOjeFzG
	uDKMOFc8RQnCFabDDbb5n2O+9/5879f2Mql/PBOFJ25mu0s91vpXu5s5YagemQV4AhOsXPORtqy
	2UjeRL+HXrc8sX9B3K72OKst3kEy83QEr+FlJ0wT5eiFSGNgTlVDH+azB17NT5fYaDqXCGX9d4Q
	+eAh7g9ch/2gwOK07ec6aXSlLY/XGmaCDqrFAJFVZ2xEKTGMKgqvWP1moYPXTTajqxq0Bs25OB7
	alssFek9+Nmr/A7jOBIVJfYq6iXwdD9M/BjPm4UreqcmUs6Do6XXKU2YQZ/FCM3vU72WYA4nztX
	gwWZFTPFYPBnZ7NAn8PEpERxXyr7ranRGvdYhWF9w2+FzS4x1eFXNc5s0kZbxJ/Ebm5xnJHAUa9
	QLkFit0XJv1ELVfEGycRvTa8fMIlU6VgNDqk69NuEll2uNRWYMxrU1FFG1BH5OF7O9NEVgePi3A
	3piwYuv8IcriT4lXxb+z3AXQxBFA0OCABwTKR1cVAEeDzKjSNtLwBNcCC5sUGFa0fo272xPrW3i
	P/QVbupaTJiFn60Bw=
X-Received: by 2002:a05:7022:3f0a:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1ac56c9fffamr9537679c88.6.1793478419246;
        Sat, 31 Oct 2026 13:26:59 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm1639998c88.9.2026.10.31.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:26:58 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] media: xilinx: dma - stop_streaming does not wait for a running DMA completion callback
Date: Sat, 31 Oct 2026 20:26:53 +0000
Message-Id: <20261031202653.4110846-1-samarth.colleges@gmail.com>
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

Hi,

I think xvip_dma_stop_streaming() can race with an in-progress DMA
completion callback, potentially causing a buffer to be returned twice
or accessed after it has been released. The line numbers below refer to
mainline at 36aad21d50d1.

In drivers/media/platform/xilinx/xilinx-dma.c, xvip_dma_stop_streaming()
calls dmaengine_terminate_all() (line 442) before taking queued_lock and
returning the buffers on queued_bufs with VB2_BUF_STATE_ERROR (lines
449-454). Meanwhile, xvip_dma_complete() takes the same lock, removes
the completed buffer from the list, and then calls vb2_buffer_done()
with VB2_BUF_STATE_DONE after releasing the lock (lines 283-296).

The Xilinx DMA provider invokes completion callbacks from a tasklet
after releasing the channel lock. Although xilinx_dma_terminate_all()
halts the channel and frees its descriptor lists, it does not wait for
a callback that is already running. That synchronization is handled by
xilinx_dma_synchronize(), which calls tasklet_kill()
(drivers/dma/xilinx/xilinx_dma.c, lines 2739-2743), but is not invoked
by dmaengine_terminate_all().

If a completion callback is already running when streaming is stopped,
the two paths can race over the same buffer. If stop_streaming()
acquires queued_lock first, it may remove the buffer and return it with
VB2_BUF_STATE_ERROR before the callback attempts to remove the same list
entry and return it again with VB2_BUF_STATE_DONE. Even when the
callback removes the entry first, it may still be using the buffer after
stop_streaming() returns, at which point videobuf2 may release it. This
is a callback synchronization issue rather than an outstanding hardware
DMA transfer, since the engine itself has already been halted.

Since stop_streaming() can sleep, I believe dmaengine_terminate_sync()
would address the race, following the approach used for stm32-dcmi in
ab32b2c3636b ("media: stm32-dcmi: remove deprecated
dmaengine_terminate_all()"):

--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -439,7 +439,7 @@ static void xvip_dma_stop_streaming(struct vb2_queue *vq)
 	xvip_pipeline_set_stream(pipe, false);
 
 	/* Stop and reset the DMA engine. */
-	dmaengine_terminate_all(dma->dma);
+	dmaengine_terminate_sync(dma->dma);
 
 	/* Cleanup the pipeline and mark it as being stopped. */
 	xvip_pipeline_cleanup(pipe);

There is also a related question about the error path in
xvip_dma_start_streaming() (lines 422-427), which returns previously
queued buffers with VB2_BUF_STATE_QUEUED without terminating the DMA
channel. As far as I can tell, their descriptors remain pending and
could be issued by a subsequent dma_async_issue_pending(). Is that the
intended behavior?

This issue was identified by a research static analyzer for DMA
lifecycle ordering and subsequently checked against the client and
provider implementations. I have not reproduced it on hardware, as I do
not have access to a Xilinx video pipeline and QEMU does not emulate the
relevant VDMA or video IP. The proposed change has been compile-tested
on arm64 with W=1.

If someone with suitable hardware can confirm the race or test the
change, I would be happy to submit it as a proper patch.

Thanks,
Samarth
