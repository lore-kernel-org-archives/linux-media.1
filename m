Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2136DA00
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.202
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394188; cv=pass; b=fdaG8JwrJb7hYDB8WpBpRhuF1BB3HJ8NK6hHEXTMLpMk87cr+z7Q1QPfQLsfik3bdNKC6YptwWRtLRZrXotBy6QVa4SnKd+UFaffXZ8rcmFn/HZoJ1Yht0hQqxCffIjzbJn3CDJCN4XM27iXeJW6FhaklycU+sKyIij8FYaZKaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394188; c=relaxed/simple;
	bh=zTRKIT0s2tS4ywlRW4Caixv+Mc/Gnk/vX5KSCXqaq5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGVnUobtK4ej7mvHiRzDP4bGsGRXgyWnRxFYy3rZj9+spJpAF00eI/Xy6WaDTNQ5G163AbRf5U0nUJu4nkxf1AxTPPpbD6LEjagCyUI9d94BsWNEcgeB/ZMb9CprxImX12DT974M6RZoBF1KlEcFvGr0a7Q3Zjmi+GpG47Bxbs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGaUx81Q; arc=pass smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGaUx81Q"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4b94bb43008so618218b6e.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 10:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394186; cv=none;
        d=google.com; s=arc-20260327;
        b=syCLA+2zIB9cjytLRbR9XtxWNWTAdqnz5sbQzSJPH7isQ5GbaHQv4tqytVdM+QdTJA
         kaz8Js/BkfBRKQEI20BjWjU9wlIWS1rpynGdtDar5FwWNjnMR49jqAAjLpWyiFaf64iq
         HWFJ0aqRHAStEJhEFTZ+D+5Oytx4XKgtndtMTtzYdt2Ihy3YSadZxFN7RUgcbuhZRZyM
         DoR0WTgPeZk3fgu9+4ix5t3SEImV9rkE3tstCD/Y743ZMZjdUB8Wb4kXJcyZl/Vv8E5O
         n8m3BOV492ln+Ykq3DJ9SXZ6BBe4B8/x7+VLn2ocKwCj2hFynkb56m0WflTlbPm2Tnob
         LHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        fh=viC179kPP7vHOgOB25Wqxsjz4x5Us1rTRCG4IOzNMEQ=;
        b=CEoRvv6kvmD9kAT1OU0ojYk7J4U/hmWRLL7TU9jo7AQZ1vqSfXK1W2OY0dkZEJMbju
         gvhJgYOoxu8JcYmcmNYqtjJAxDMp1ObEaf+avrfk5lRTC7dXqsnr0ZWqOEszy/vnVbrF
         DtX2/ZIrz3xN6IRfc6J4b13OqCxxEv0Pd/DBOZ4Dwo1bJqus1oEi2g1ioaw8/if49AH0
         rMzy1XatshPZeVh/PCS8Youw9k8F3iEnp++jyMd8nBbYFN1pCrnqbcfvrVpboxPn++6D
         5tMSKZ7nqpvKdvy3RL9Ho3WkfI/agt8gGz8hTdx+KJ8N7dzWmAzmoli+NOwqxPEi2tOm
         y0Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394186; x=1791998986; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=PGaUx81QKnvLqC7bDwSMY/z8Nqbmf6a+1L5WRxFb1rx2cSujFAT/MEQJMI/RJL3y07
         gvUq4QLJn72zWMVgplmXC/SPFxlPh907Oz7qJrTimqwdp6Zxj2fPwpi7kq8vH7WuMPw0
         r8tmDJ5o5pFgd9+E3AsxKHZ+Xulw4mkDKh5YoiL2geX4CdCL7Un8D5AXDM57+gRU/nSx
         B/fIoHCxu35V2tXPPG6N4suOCYAOqmI/fZSjkyVrEcFIL4doJgxXJbi/xFrlMOwiXkW3
         N/RokhItCo7NiV3XPbeFqO1Jfzz83A1bxBiO8783IXO1GI522ttLAjnPycIXu8AmIwx7
         kjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394186; x=1791998986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YnViTh6p04B6V5Rf/libt8dMfoBMvVqz2GPx2ijVnM0=;
        b=ryUD6L9tiuqADdnleBEaqH7I71gCKCQrZKKke/XSlk7E28qBsHe6ZB3vX5H2RaDfGJ
         gYK+UFBotvt8K8vstDZeB1N+H4ol8RaxDF+TH5bjGzeMN8x2YkNBgjaOFfXVrRfpMkUc
         egGMCsXjVSbt+MiF0Y3MPVHfCm3nEHBlmCo7ICrIgqnDKkfPpX40pZMTO48nZHRT++Cf
         JeEcCDc0tlXJIkqBKMIYGCVhAJmr8BxPNdGeBZFLMIoLNMk7pIBGFdcgkRzBoVQYOM+j
         7Cdb7w8ZcUDGkqSQOIsf6QScbKDk4phNpebH0BS7uc50Uucf/vtD0qzMEaWFCxsU9xVe
         yvig==
X-Forwarded-Encrypted: i=1; AKwUvBzMwarNd59f9ZzOh3qcvXIzevlEzCGOWMts6R9Ptg1uQwGFlHY16/N0/8KmNOvtDhxyyywhnpDJOYKQfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mjTXiZ8D2LQNff/Hluv62k6C/KdkvPryzWDkd7chMS7F4N/5xP
	ll4EXPrZirnMmziwpeak7Rtb5nK3UwjltrWYK2mChCThAS6f2k20tMsR0gN9yTsCuf7m/31Icsv
	tVe1yVMj++kNYe6xvsS9bmg9koKvkXk8=
X-Gm-Gg: AYBFou0gpvfI6AasYb/XMH4+IXb5lRBmevL+rlQiZET6uYK9fMbouNQT8OtehuBz2JF
	6Qw1lBHBPcFZ+sAWMj6SVTBsKtR9UNYhm2Y5Gl1fvUgMPmYvnXdn4SPcNTUe+z7liUpVyi+yW1H
	6OA/4UcEcFlRACqdsSFgAsIoRnNrlwBn2NM8/CDI4ofe8iVN8SdFys7PKoBZqrNQLWbenRlcNIL
	B3S9uL7msV+O6esOKQlDH9JWT26otCpn7ISTCH6Drh8QotMF2RFZPmy6xjYPOJm1n2NRg5oOHyQ
	L8ev6z3ZrLwQ7eOKiP48hj0M6ChYxUpHZZacsdLr3Fwz5cH1P2qZFj82ZPDy3ZQ+g/oaq5qqpbR
	UEnM9O6FRURitew==
X-Received: by 2002:a05:6808:4f69:b0:4ec:ba7c:1dbe with SMTP id
 5614622812f47-4fc4729811bmr3186518b6e.66.1791394186597; Wed, 07 Oct 2026
 10:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 7 Oct 2026 10:29:35 -0700
X-Gm-Features: AclHuK9vHOpqv4f2YdIvTFbohefG3iRaIeqgIeMjJY_8igy6Stps8jGud7-4xKQ
Message-ID: <CAGEkeHd_KRRUZ8Kqvmf2BWF8stVg=_FSbx701ibS=KdoAy4FZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil <hverkuil@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       if (!iris_vpu_watchdog(core, core->intr_status))
> +               iris_vpu_disable_irq(core);

If the IRQ thread records a watchdog after this check, while
disable_irq() is waiting, it skips enable_irq(). The hard handler and
helper would then have disabled the IRQ twice, but the next power-on
only enables it once.

Could the helper recheck the watchdog after disable_irq() returns and
core->lock is reacquired, then call enable_irq() once to balance its
extra disable in that case?

If you use this approach for the watchdog fix, could you also add:

Suggested-by: Hungyu Lin <dennylin0707@gmail.com>

Thanks,
Hungyu
