Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124844;
	b=BnpVPYey0JlY5WtzdPiO5/n0oIotf5a85VdcdCVtxkVQT+HwuHmJEEbTt5qk+B3lnZrx
	 DFZjJoH55xaTDAAYW2mSqbPiLFTii2uIdN1RrFtNuAGc5J3DpjwbFU3JCbAFKTpeswbP3
	 tSqiPtjVAMY1mj3n/J33eSVvlvlxtI+xx7rUlZ1aIUC6BrVKAp9dsHmMnVQTMpGsezve2
	 1KsyQKdZq2Wk7RGYdcRf7YyzTOw5VF+bqDlTvUoyVhk3gGVMfACjBGdvL5hKq3mgdxlAc
	 kF/V8rfGF8tJJSJEVJClNivinb4oopipWX3eR+LKBdgmBeWUQkKv8wDwLTaxR1fzMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=K4o0hsfCr8qItqNcAeYTl+Awx2cc8eddNn4H7ZE/4Hc=;
	b=oPv4bRv7fG7tsANYTpcr4OVasbhB/x3wmrQRmIHuq6prLcwpSZZFR9TxY6v66OcZJMBV
	 g1JPfxha42sMhyvp2JBVEORs2/SmOJd4LdEpfjow7pNMyaEtMpdgOsiyPfJk3ppSItu+d
	 //yvfqD4dpL7vLUWvoJB1BuU9H5lxp/4mQO7f7bVLTtaksyfQZsPuUxWj0IJRqNmr/8c6
	 ZOwj5khiOk+unYcy9QiuoINhwa0S/GmYgvHNhojMW8s6GCPUCSbeAlAeUDZFeERqpO3Bb
	 wFZmvooQpinlezaLF2uTM0/YjYLjseeOav6NWH/u7Dz+7kiklo0+KmGeeh9T0kEHkrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TptjDx4j;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E4606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C09E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TptjDx4j
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679e6ab6471so1362318d50.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793124843; x=1793729643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4o0hsfCr8qItqNcAeYTl+Awx2cc8eddNn4H7ZE/4Hc=;
        b=TptjDx4jMAwg2Qt8cQIV+w83R5Lt3MX0LsbgWQijLZHqjkjQQbvu7Z3XTrLZH4PdVf
         skRLuY++QPeeBvoH+DHJknO4wi0B9BRZHMkE9qZVwztQVdBVsfLz2Umn8p/PgbRbQwC2
         x+7Pc0QObk7soUTHFSYWn00ibUkzPeuRYdfex0wvJBYz0xA7EUxeq839QhrlPa3ARG3L
         dXsCmsxSC/TgSz6iWKQacNWhFgXh4uQMDJZy7XvBp8sbslOWhGaQ936WHBKDjEVtPsX0
         BOaXtNYwBCDJ1+EHE6bM0wEbyrGkZxDxk+fbBGu/mkSNljIQ8ttMMfsepGfWZ+jzTSlU
         y4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124843; x=1793729643;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4o0hsfCr8qItqNcAeYTl+Awx2cc8eddNn4H7ZE/4Hc=;
        b=SkNzQRcJ45tNShQKk4Ykb2B+4CITd01mPD0irpBkGPLNcgOGMDyCRh43K4cp7XX78u
         0D0xeqOkX9nTXSTq5cTBBq6eKuwN33T1e0c/I3K2XEQ4nxo6GD6YmbAqHWqNv35qorTq
         MicFG9vAQ2RH7oeN7kC8tNlqN5BnUdlOo8oVdfGGhAJc3ETkd4D7u4/C42s9A0eebtpB
         h/SprzntvpftheRuxMnn1qBPEmXJmrKuaWvgUMw2HZ8VPiPPKMqv0UdA7b4n/F2yic6E
         /Dg8wv07zQOiKaNCNw+/EJmcjtyRBBmKl1xtJPDcs0CUItS7Bh2bWcm0Q9D+HWtVSFEE
         lnIA==
X-Forwarded-Encrypted: i=1; AKwUvBzB8ki4BB87fuO6ZvsqQbZKSq/yO8Qu/PuMkFuxOOtK7HuESntMTitN5F/DVzc9hwEvSgDX5lHfcYEHQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8caY01SkFbyGzCn5KEv7MZcb5q4gmf5ouJQD4yxKHpf/FV0/C
	ypCE+s83SZDx2Z2kZ/h6Xiw23kWYOrWshzgjApbyuQUFiNTJybkhhIEK
X-Gm-Gg: AYBFou2yqviSFdAqqEWQYiTYnDVfShSMIKHG3D9UWrZLLbhKqH3pde+dEcRA2sHZotl
	p/hWWhcG/rMNjZUgyBC/iWrzhI9+qmDEyVAx7zIMaBWYY11deVj3Le6CSP6Nt9EBEIqqVeCN9K2
	0EhHps9jXkIH+cfaoPm6X2HebCtqWOHsYVoI9Jt+N/ikJHSmsHjjzQ1wKjP/Qny9OSEL3/RiwpJ
	5UVYSYFR9xAJLSho/yXgS/ferYELeML5gqYAgMI7bbTcDu7jOH8WJedWDiPc07UG0ief1itM+Rv
	paHILpnpce5Ama45LQ7PRsrl91PktX3jZxRdnOmRpjvIoovrCSRuZLofTSStb7H5qrIFbY5LcUt
	Pi75yFPeyMZ3VVhTX19yY8nTMCY3Xpafh7hMrnWMhdRcYegl6+eWyxTSPRi691qhW1yMmCf4qUU
	jvGBB+aH+hrR95V/N1uMHakjVYKk2D+Q2d40vUF9atmRyrZcpw0zmWqcdBCmmwgCfKS1BKXOhUa
	rFReR5qO4jYygB8ZJAtUy9zUICR/tFuNKRhF+mZIv+XxWc56el18Q0nBomBHwCKbaS4KINV5Nxu
	bs2nK3tb9SxldlLOnRXeZLkEZe0Kdx19FvTo3i1z8MmpbxtfPSM4sw==
X-Received: by 2002:a05:690e:414a:b0:677:cb43:4b10 with SMTP id 956f58d0204a3-67a6de9d295mr2246308d50.6.1793124842656;
        Tue, 27 Oct 2026 11:14:02 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f365b0sm543038d50.3.2026.10.27.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:14:02 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Date: Tue, 27 Oct 2026 13:14:01 -0500
Message-ID: <179312417145.10007.14957642704462684875.iris-birk-reply@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179310500796.73918.9946996824482992887@pm.me>
References: <20261026160952.22082-1-ccortner@gmail.com> <36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org> <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com> <179310500796.73918.9946996824482992887@pm.me>
Content-Type: text/plain; charset="us-ascii"
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

On Tue, 27 Oct 2026 12:43:32 +0000, Birk Skyum wrote:
> On the unmodified driver ba stops as well, without the errors. After
> START the client gets a second empty LAST buffer, START then returns
> EBUSY, and every DQBUF gives EPIPE, which looks like the stopped mark
> from your problem 3. The fatal errors come only when the count rises.

Thanks for running it. I booted the qcom-iris.ko of my kernel
package, which has none of the five changes, and got the same here:
when the client resumed with V4L2_DEC_CMD_START, both streams stopped
after 30 of 60 frames (2 of 2 runs each), ab with the five fatal
errors. With -A both decoded bit-exact (one run each).

With kprobes on vb2_buffer_done() (recording its caller),
iris_vb2_buf_queue(), iris_dec_cmd() and iris_vdec_start_cmd(), the
stop traces back to problem 2 rather than to the stopped mark. In all
four START runs:

1. iris_vb2_buffer_done() completes the empty PSC_LAST buffer as
   VB2_BUF_STATE_ERROR (the client sees flags=ERROR|LAST). For an
   ERROR buffer it returns early, before it sets
   inst->last_buffer_dequeued.

2. Within 0.2 ms, before it has dequeued that buffer, the client
   requeues a frame buffer. DRC_LAST is set and
   inst->last_buffer_dequeued is false, so iris_vb2_buf_queue()
   completes it at once as a second empty LAST. That branch also
   queues the EOS event and sets the stopped mark.

3. The START for the first LAST returns 0. The one for the second
   returns -EBUSY without reaching iris_vdec_start_cmd(), since the
   first START already ended the resolution change. vb2 then returns
   EPIPE for every DQBUF: only a START that iris accepts or a CAPTURE
   STREAMOFF clears last_buffer_dequeued.

The stopped mark doesn't halt decoding: in the ba runs the firmware
completes all 16 CAPTURE buffers within 11 ms of the first START,
and the client can't dequeue any of them. With -A the second LAST is
made as well, but the client's CAPTURE STREAMOFF discards it.

On my kernel with the five changes, where patch 1 stops flagging the
PSC_LAST buffer, ba decodes all 60 frames bit-exact (2 of 2 runs). In
today's run, with the same kprobes, the client got flags=LAST and
iris_vb2_buf_queue() completed no buffer. I haven't tested patch 1 on
its own.

Christian
