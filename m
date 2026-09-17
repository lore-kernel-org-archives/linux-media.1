Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62D058FD20;
	Thu, 17 Sep 2026 14:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654915; cv=none; b=eBn4NMex0nS6gY9xRjis2HXoqOjIU09oQcJsQGoHkD8tbmPf5vmxN5XDBCAWtyeu6VmzX0/NsMFBMfmWHlTvZOCOYLpZjYfXrRLyE+o/EFxTCaEDysW9P5QrxIeZ/jtDBqSsFGm6N0vpAXIAEhfoxgEuYguzP/8U+lBC10Jd4zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654915; c=relaxed/simple;
	bh=+vgCc8pndNcFA20Sc3PJPDo3juv2YALtT4MKY1Xd28k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J67RHeralSsHyyE03Z/YOZLXfVYIEzzbqhdZpZ+We3FuIvumtGfHmT2tmWb5B682ceezF70YdR1LAOLjrHaIKNXKEozn4BL1nzP4t1itwXt4k8ncrNrRGzyOcJZMKWHRIMqqijUcGFKiMLvl7v3mk3aOinUl8am/pfvpgRmZIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QmAgfiwL; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QmAgfiwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789654911; x=1789914111;
	bh=+vgCc8pndNcFA20Sc3PJPDo3juv2YALtT4MKY1Xd28k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QmAgfiwLZtUbCfpQXIWLluH4XOqAWJA3w/+TJjpJm2eVWUNVUbCPAR4To1F5xwTyk
	 ZTmg/jRb+UixBqTEDDpVf5C3yiunu+Ft3xmMiSXvY9afmwO8P6trMXY5AHB+eQla5I
	 tScwz3CDyKqD8RwnFpdyEhqgktLp/mY6829RDgQiHa1vE84lIcHsMbPiV4qwkQ09Vx
	 bI0yIZQmjvYHWKGRFyI3E1z4Hb7JbkM8jfJyOFcwuMrcgV06LvdeWWM83Ei2DMR9ib
	 Q7qUdwi/IjI+hWMRS0koDUgSexXLcJS4Cr6ZdFVFFW3EYeiS9k3l6ikAQiqd9/0Yr3
	 7BdEafwIfpv9w==
Date: Thu, 17 Sep 2026 14:21:46 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Question about Iris SID override assertion on Yoga Slim 7x
Message-ID: <OoKudsYPY-u95rP5XMKUybXGVhJkH1D42R8fIGkv5Ls97TUXeuw6SREfrtyuUU52YDHb2msUDr_VsC7OJe_rD9vo-YXJ8tGt7zCta2b7FJk=@pm.me>
In-Reply-To: <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
References: <20260913194707.91885-1-birk.skyum@pm.me> <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 59379bcf373598d55c5d90fd821d437f0db316a0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vikash and Renjiang,

My previous reply was rejected by Qualcomm's mail gateway. I'm resending
without the attachment and have made the reproducer bundle available here:

https://github.com/birkskyum/iris-sid-reproducer/releases/tag/2026-09-17

The archive is unchanged from the attachment. Its SHA256 is:
5b38ccc616d8f1166334896e1840fa5546b59268569d0d226c2986edea64e97f

It contains the original synthetic VP9 clip, the FFmpeg 9.0.1 patch and
build options, the test harness, the exact Iris source changes, and the
first-failure HFI/SFR trace. The files can also be browsed in the repositor=
y.

The FFmpeg fix requeues empty CAPTURE buffers marked ERROR but not LAST,
rather than treating them as the end of decoding. The test starts a fresh
FFmpeg process after each verified 100-second runtime-suspended interval an=
d
compares all 120 frames with software decoding. It stops at the first failu=
re.

On the firmware-logging boot, the warmup and first two idle trials passed.
The third hit the SID assertion before producing a frame. The separate
AV1-only partial-buffer guard removed the VP9 warning but did not prevent
the assertion on another cold boot.

This still reproduces on the modified stack described in my first mail.
The bundle separates the baseline and experimental Iris sources and include=
s
the camera-kernel configuration and delta, so those differences are explici=
t.

Thanks for the GDSC lead. I haven't established whether that behavior
explains this case. Please let me know if there is a particular baseline or
targeted diagnostic you would prefer me to test next.

Thanks,
Birk

