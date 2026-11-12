Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794512981;
	b=VGdxzcS9vE/ilk2br3+99kEnkuopZHmeYxtmtkcp5+W3FfKenBVrWT/85Ik43egK8ggi
	 C7wDmPNvYrULdsfrkPgVTnD8tc26SDVR/F3WjkFSaz67YOQIo/jXfPc27HUgmp1zyHG9e
	 8jHIO0tGGBcR7900XVSKDLVQMVb/Wcp+Ui57OwICzGvl+vuoNMbumISuWaZGzw5Q8IhFj
	 uBy8i+49KrHiI9su+tIh61aSyf0T2T6TgYbHWQJH1xnG6IKSHAVxgf7ng5UGXmdPKOtVA
	 o7oYCx43JaB6CD3pr+EpxGOzx9w1uK+f7les1H5Uql/bb4zqTJZxuGy4YptI7HDWRcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512981;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:Date:
	 Message-ID:X-MBO-RS-ID:X-MBO-RS-META;
	bh=KX3SnDwv+3SXiD5wUpDxYo+vmZVlbQqd62th2rXq92k=;
	b=0msTdIUFM+NiVFbPa8qaUx8+Uj84ZanXzs9e9QO4JPOccuFVvQyAAZOnYa2dBaImI3hp
	 X1A1ZN0U0pGOao/5WugPGm3jK5m7VMvrEvpuuq7a2A79xHqV7aPbRsR49elaTv0PwJA/N
	 7+1Ueh8IOM/KGB08aeGqlfkQsCbJLqn4vLFA8b5tiyQz13hXKSx0UWzOBlts3WjGICSkO
	 9KeMHMdk3H4D3tj44/2KZhWcLs+G7DQabHWB3v0ackZuZXV6crdVIXanCVdi9uUoiueIb
	 KsEEgZ9BGi6VUKcSYW7W4Zp7TczdCpKtdGH5e7791oQXaskLA6rsva7q5qAEqvV+2Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=qbmIh2uV;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5559606A31C;
	Thu, 12 Nov 2026 19:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5559606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=qbmIh2uV
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jQWDx0bb0zMlth;
	Thu, 12 Nov 2026 20:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794512977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KX3SnDwv+3SXiD5wUpDxYo+vmZVlbQqd62th2rXq92k=;
	b=qbmIh2uVbkH0d6KLD0MKSRcsIXRfuMxpZZC6xMLEUBijnzZDD5htRKlnWfvn4ghx7oxZTX
	rSaZY5n53PEVlMgayFYxLJ0Dk5sXf0blkQLrElRJ/nrMlthyVRKkP7TWVrJFDaxbK204Pm
	Ha0fZFic4p7XxctiETJ/nfYQGM9UnSV3PC6iNhTM2uSjAsrUeDJr/+uuxtmsftBM3CneDl
	zH2ug16YrbtDt/S9SozGRHZB2uJVMjxH8uGtS8Os6fFs492xQFWbPeArwNVz7S5e36+aS3
	BLtVld6QTjfnwR9gq4a0g2zPxw/TZ5qokjjtGZReBVcLqG8jjPhvY6k4q8sgKg==
From: Tobias Hahn <tobiashahn@mailbox.org>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] media: iris: Fix power-off ordering to disable power
 domain after clocks
In-Reply-To: <20260801075115.0CA6C1F00AC4@smtp.kernel.org>
References: <20260801075115.0CA6C1F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 20:49:35 +0100
Message-ID: <179451297509.2464698.8202615290339964735@mailbox.org>
X-MBO-RS-ID: d2c471e58745a96ae7f
X-MBO-RS-META: duukm7qparzgikh66b9bktaiqyhx7dxa

Hi,

regarding the AB-BA deadlock between disable_irq() and core->lock
raised in the review above: I hit it on real hardware. Same
disclosure as in my other iris reports: an AI assistant (Claude)
matched the trace to the code; the hang itself happened on my
machine.

ThinkPad X13s (SC8280XP, HFI Gen1), kernel 7.3.0-rc4. Running
"rmmod qcom_iris" after some decoding hung for good:

  INFO: task irq/317-iris:587 blocked for more than 122 seconds.
   __mutex_lock.constprop.0+0x508/0xac0
   mutex_lock+0x6c/0x90
   iris_hfi_isr_handler+0x30/0xc0 [qcom_iris]
   irq_thread_fn+0x30/0xc0
   irq_thread+0x19c/0x3c8
  INFO: task irq/317-iris:587 is blocked on a mutex likely owned by task rmmo=
d:64864.
  INFO: task rmmod:64864 blocked for more than 122 seconds.
   __synchronize_irq+0x9c/0xe0
   disable_irq+0x4c/0x68
   iris_vpu_power_off+0x68/0x98 [qcom_iris]
   iris_core_deinit+0x7c/0x150 [qcom_iris]
   iris_remove+0x28/0x58 [qcom_iris]

It is timing dependent: two later rmmod/insmod cycles went through
fine. The module was the in-tree iris with my local 10-bit change
from my earlier report, which does not touch this path; the code is
the same in current mainline.

The runtime suspend path looks the same to me: iris_pm_suspend()
takes core->lock and calls iris_hfi_pm_suspend() ->
iris_vpu_power_off() -> disable_irq(), so an interrupt arriving
during autosuspend could hang there as well. I have not observed
that one.

Full log available if useful.

Thanks,
Tobias
