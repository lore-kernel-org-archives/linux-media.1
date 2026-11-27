Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793186;
	b=I9Iw9TatgBHIzJIs9J9fg43kuTU9JbtrKqS1xE3iDdlmqyn+znHQ3ogzWvvd8vyihDQv
	 2PNSU6480Ygajs70xYnz0mpyG1VZw7V+wksHaslYKoodmKkknrFadwJhf16qZ4s9Hvttx
	 rWdr+jYebv64J7OZyIc6Y1NueaNUmh+Zq32M13OcEmjpHZN8+wbbWTWkkFxkmhzT8xO15
	 tZ+uxhoyg86XTsF2qw9RDnNY8Jecdhq2ArpFo7cx8hObERjYRpmNZ6Qc1nce1ora2TeNT
	 w8Qh8dTNKhA7xrtFFV2HJP9BJxj9VB5gJq2sRX9L5olrt308VUeBhZsRM+96DoVx22A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793186;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Cn8J32uTGtMslRtCIcKhh5GRTA7wlzF7vM1J878/mN8=;
	b=inkPsVJySHLJYnHdcXWs3ZBEMQVcCBgn1S6ox42F/6TG1wIkeMGfM+kkN02SYkVypjaj
	 Dh4AGIqTcM+hREauOsl2H28ZstrfsqjJ2G3wZEToVR0KdStun2CHHi+aenwmIYsIvvLe0
	 YLhOV+MRh/c+QAEG7xz3chQun0mA/lYiGq8ATQ0gV/nPvVb3BUe93bSRNxNH2e6HYxo5v
	 u0IKdamJbVYsRiMkdcTXzt2dBXa4Hs9KGVJ/DwHXRaaOP/O8gTXl+7N2WPCJo0EMODh2/
	 FirR4a5OZBWgVzlUttZUSB3+1JKeT+A+IY8rvtJvAmKXp3HLmjChuKFK9eEeS4tiagw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Gky9TahE;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31F5606A31C;
	Fri, 27 Nov 2026 15:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31F5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=Gky9TahE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version; bh=Cn8J32uTGtMslRtCIcKhh
	5GRTA7wlzF7vM1J878/mN8=; b=Gky9TahEHQYWDavMCXB/d+dDvyku8L7kawAF6
	m5DcbcfXts3ZJ9R5D77Zrow5QrljUJnZhKkaFxxaUUYds0AjPp/5k/3xPFggd57G
	bHL3K3D2KbRqdMVokP7JvOkW+YOtdI6NZ2JBNC+Ri55Xy0+nh/uauVFTBb1uzTsH
	Myy+QI=
Received: from [127.0.1.1] (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBn8kYVoQlrFlYDAQ--.2904S2;
	Fri, 27 Nov 2026 23:26:13 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: Re: [PATCH 00/11] media: iris: fix the decoder source change, seek
 and START sequences
Date: Fri, 27 Nov 2026 23:26:12 +0800
Message-ID: <179579317286.2262269.17942928243908736028@mail.ustc.edu.cn>
In-Reply-To:
 <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
References:
 <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgBn8kYVoQlrFlYDAQ--.2904S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4ktw15WrWftr17KF1DAwb_yoW5Gryrpa
	93t3sxtr4kJF10kr1Iqw48Ja4YyrZ5Gr4UXr4UJw10yry5Ar18ZrZ5Ka18uryjqr93uw1U
	ZryYqwn7JF1DAaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bOUDXUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAysH

Hi Neil,

Tested the series on a Snapdragon 8 Elite (SM8750, Lenovo TB322FC) with the
vpu35 firmware (vpu35_p4.mbn) on a 7.3-based tree. Before the series every
decode failed with "capture: driver decode error"; with it the decoder is
fully working. Details and how I adapted it to my (older) tree below.

What I changed to apply it
--------------------------
My tree is from 2026-10-14 and had none of the base symbols, so a straight
git apply failed from patch 03 on (context drift, not semantic conflict).
I applied the 11 patches with `patch -p1 --fuzz=3`. The only real gap: patch
11 calls iris_vb2_signal_eos(), a helper that comes from a different commit
and is not in this series nor in my tree, so I added it locally with the same
semantics as the inline block in iris_vb2_buf_queue():

	void iris_vb2_signal_eos(struct iris_inst *inst)
	{
		const struct v4l2_event eos = { .type = V4L2_EVENT_EOS };

		if (!v4l2_m2m_has_stopped(inst->m2m_ctx)) {
			v4l2_event_queue_fh(&inst->fh, &eos);
			v4l2_m2m_mark_stopped(inst->m2m_ctx);
		}
	}

Results (H.264 and HEVC, 640x480@30, 3 s = 90 frames)
----------------------------------------------------
- ffmpeg -c:v h264_v4l2m2m -i t.mp4 -f null -   -> frame=90, no decode error
- ffmpeg -c:v hevc_v4l2m2m -i t.mp4 -f null -   -> frame=90, no decode error
- framemd5 of the hardware decode matches the software decode for all 90
  frames (0 mismatches) for both codecs.
- Moonlight (Sunshine host, HEVC stream) now picks hevc_v4l2m2m on
  /dev/video17 "Iris Decoder" and decodes in hardware; before the series it
  fell back to software ("[h264_v4l2m2m] can't configure decoder").

One note that may be useful for the changelog
---------------------------------------------
The spurious ERROR buffer is not fixed at iris_hfi_gen2_response.c where the
zero-size PSC_LAST is flagged (that check still tests LAST, not PSC_LAST
after the series). It is fixed earlier: patches 09/10 make the first,
unchanged settings change unsignalled (early_capture / drc_unsignalled), so
the zero-size PSC_LAST is re-queued instead of being reported as an error.
Might be worth wording the commit message around that path rather than the
flag check.

For the record, the series also happens to make several v4l2-compliance buffer
checks pass (REQBUFS/EBUSY), independently of the three format fixes I am
sending separately.

AI assistance was used to prepare this report; I reviewed it and all the
measurements above are mine.

Tested-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Thanks,
Qianhui

