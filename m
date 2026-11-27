Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812156;
	b=cZCTC8WV3vdx99WT99QlotjQvsNjcdtFuPJ2YcjYoVux10Q4IbHBmFKOohfTvO53Ip7m
	 iXcbsXy/Lwvq4BvznZ4Xst8u0JPFiXp15GwLOw1ca6V11PpGZLyU9uQKsxCap0EKT7X5V
	 1ql7Qik+emIZ2A2GcYJDKV0YyrUO7salnQ1xoBLgsqHoIH1Bqab0Tp59XrLwC/aZppf7t
	 EEwPlM//u+lPAmzXEjyL8Lk0k7E3D8SftrF+0SzHNm3NbJQZl/RBdPQvHVDviYqKdnXcI
	 I8tGp821iu1CsikEP6/O8srng0zmIaXydm0ipwepepy3jxnggvWU6aeq23Fv/Q9qh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812156;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hk5ieqBBq3QVxwM7VrYWL5hHA+EffxIuZBip+/O7PRc=;
	b=EqchnogqIGcZU1KtLmr5jHuLNB0b+Io1jrTG9PHksjEtYbQeR/slqKAcGvySivvEDSbu
	 QLM/qxp3qSyye842hvuEfbHGp0x/UT929zdTuLueAmXzSNJ7z7ZtEIYYLmqBPRyFa+oxR
	 L3A8/Yu88/slyXfQNEJr/EcDBG603KOXJXgYjVPL6n2EpcbO8cQS6sf4IotcSNtQgR90+
	 Zxm5zdjarWdP2vTPBFWMW4hMbwVExSwvS5YE4t1DDdiG39sGvNghsAoMk87E89WmKXg+7
	 StJ36YGl1wpFASu1ksZhy7GWEVAsNukTRnJ22kCP4DbSqwtaEBM7InDmendtjgmhP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=J2yUIkAn;
	arc=none smtp.remote-ip=212.27.42.2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C76606A31C;
	Fri, 27 Nov 2026 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=J2yUIkAn
Received: from [IPV6:2a01:e0a:1165:2d50::debd:3887] (unknown [IPv6:2a01:e0a:1165:2d50::debd:3887])
	(Authenticated sender: jau@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id D6F182003CE;
	Fri, 27 Nov 2026 21:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1795812148;
	bh=Hk5ieqBBq3QVxwM7VrYWL5hHA+EffxIuZBip+/O7PRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2yUIkAnikCIMFhMnBXHPFvPsAybiM8fAZVDQ5gS5Xikt+pvbL6WatHlHNMs7uvlh
	 EMVFTNFBQ2x9LmIPN4jh2BFRHvmyQScfiL7P3G0V7Y7h2IqeYMQw+h8N7HTo5Nx//O
	 HMGcPDm4JnOVR+2QZ21rAQRf8d7J50Dx2SqX0RZA4NTaRpakSun5iJnyE6fC0HQYEc
	 PG/qvdSqh+oyCY3laXVvbqm3y0UYRBHilnG1bFXCIdjRQTqE+m9fk5Ndgctm+iHtkm
	 nmkJ+YcSsmf5AsBl37wViYde4aeIWBgWeXpc9qQQ94M3HXP4w79cZHUd7N9pI3fbAQ
	 JmJwl2+kOKUeg==
Message-ID: <4a83619d-cbc2-4fd1-8b0a-658348ece869@free.fr>
Date: Fri, 27 Nov 2026 21:42:22 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: st-delta: fix decoder use-after-free on release
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Sicong Huang <congei42@163.com>,
 linux-media@vger.kernel.org, "hugues.fruchet" <hugues.fruchet@foss.st.com>
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org
References: <20261028074439.2515928-1-congei42@163.com>
 <efe647d6ebb9583696527ee044093ba54ff0b9a7.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?B?SsOpcsO0bWUgQVVEVQ==?= <jau@free.fr>
In-Reply-To: <efe647d6ebb9583696527ee044093ba54ff0b9a7.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicolas, Hugues, all,

On Thu, 2026-11-26 at 16:47 -0500, Nicolas Dufresne wrote:
 > All the changes in this driver since 2022 (and even there I'm not
 > sure) are "found by code inspection". Is there any users left of
 > this? Shall we just remove this driver ? I'll hold on any changes
 > until I ear back from Hugues or someone at ST.

Yes, there are still active users of st-delta on real hardware, so
please keep it in mainline if possible!

There are at least 20 active boards — specifically STiH418-B2264
(4kopen) and STiH410-B2260 — running kernels that have been tracking
mainline closely for several years (currently on 7.3.y).

Over the last 6 months, mostly as a hobby project, we have done quite a
bit of work on top of the mainline STi drivers (st-delta, st-hva, bdisp,
sti-drm) and completed hardware decoding support in st-delta for
MPEG-1/2, MPEG-4 Part 2, H.264, H.265/HEVC, and VC-1/WMV9 (whereas
upstream only had MJPEG), working end-to-end with GStreamer and
FFmpeg/mpv. To be completely transparent, AI-assisted development
helped a lot to make this feasible on spare time, and everything is
thoroughly verified and validated on real hardware (including
conformance bitstreams).

Cleaning up and upstreaming our fixes and additions will take time
since this is done on spare time, so I don't want to over-promise on a
timeline, but it is definitely something we would like to do step by
step.

In the meantime, if it helps keep st-delta alive in mainline, I am
happy to test patches on real hardware (including this use-after-free
fix) so changes don't remain "code inspection only".

Best regards,
Jerome
