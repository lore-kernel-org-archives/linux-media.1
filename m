Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8843B27F3
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262437; cv=none; b=VGAqTk8Yklh26yd0CN7XaWF4MKQ8mfjejf11SPGk355NPfzRa3D3SeLciuc3PorQQ5Cf4ReWHgUtm1qF+bcRPo0jaQx7WVWjXPSwj3Cg4DG7kri96hFH0I24AydGcObJVoZHIMr/z2FMNPJhq+TPNG4rGMyNaxw6XfzShPWO6lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262437; c=relaxed/simple;
	bh=5xft8eJa0QNMzpd90BhGrxG8kedqaG3IPDTXHPrs6lo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mH0oS0JmZMBjVXAoVzumKgNVKV4T6+frB3tmtJkg+T+0y5s77F4Ml+odDuZ5M4w9HJLEss3hu8cOaCdrACzfkinbyzmJ3XHMVXWSQ1lqxwzkRJz4ZW+oopZbWWp+/WEY5wGol5eie52LzYfhbm1lJzI/AUlmMMdpJMKAO1ngkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=m5an5Bmk; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="m5an5Bmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790262427; x=1790521627;
	bh=qwBKf29VcuHB7HKuSWQx1q6Apu9zfSijrijhMuM7/Tg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m5an5BmkaqqyqKyNY2rOpxXBJWEK54I1vFu9elYbrBOIhHE56pXfk43AUv1JnWj3+
	 sP9igcSNS0IpW1GbZPqz8k9bZJ2ZZg+qrJ6eSj3XaHQ31Urgvlf+CbwcUN9fvUm7gY
	 WiNPKGEr6KZpMxuDf3V1oCxMgU+7+3AsMQNvq+dztFItJ49e/TLNQ7iC75mRcfMDVi
	 6S7f5c/B4BAPeP2MrqweOWDoDKXAb/mHEYq63iAiAJLsJzQm6gjCBKPwaziWhRnhg3
	 FCFGVrd+ITiANGh1NLXUYAgSZdx7O6yq7CQQi2LaROrfkXXtcd8Ob248JDCWuuWjOq
	 B/LbbW9SzkPHQ==
Date: Thu, 24 Sep 2026 15:07:02 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Question about Iris SID override assertion on Yoga Slim 7x
Message-ID: <L_J1jOdE8Ng2gXPC9_ZA3WKXcPoIjuQ0FdeKF4SQwh-T3AZ5knRZJBIg9ZT-B2oajnx13oh_X66-dDEInmvP1qeakD6RvHckUocQeaLCsDY=@pm.me>
In-Reply-To: <e167a249-54da-4f1c-9285-a439776c4897@oss.qualcomm.com>
References: <20260913194707.91885-1-birk.skyum@pm.me> <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com> <e167a249-54da-4f1c-9285-a439776c4897@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: a25912f61411e0dd7eda8682116ef7fd98033ecd
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks! This fixes the SID override assertion I reported on the
Lenovo Yoga Slim 7x (X1E80100).

I applied it to the same Iris build that hit the assertion, with the
same kernel and firmware, and reran the same test: decode a 720p VP9
clip, let the device runtime-suspend for 100 seconds, and decode
again. All 9 trials passed, every frame matched software decoding, and
there was no firmware assertion or system error. Without the patch,
this test failed on the third or fourth trial.

This was on the modified test stack from my report, not a pristine
mainline build.

Tested-by: Birk Skyum <birk.skyum@pm.me> # Lenovo Yoga Slim 7x




On Thursday, September 24th, 2026 at 16:41, Vikash Garodia <vikash.garodia@=
oss.qualcomm.com> wrote:

>=20
> On 9/17/2026 4:50 PM, Vikash Garodia wrote:
> > Hello Birk,
> >
> > On 9/14/2026 1:17 AM, Birk Skyum wrote:
> >> Hi Vikash and Dikshita,
> >>
> >> I'm testing Iris video decoding on a Lenovo Yoga Slim 7x (83ED,
> >> X1E80100).
> >> This is a request for guidance on a firmware assertion. It currently
> >> reproduces on a modified test stack, and I'm working on reducing it to
> >> an unmodified-driver reproduction.
> >>
> >> After repeated runtime-suspend/resume cycles, VP9 startup intermittent=
ly
> >> hits this firmware assertion before initial stream settings or CAPTURE
> >> START:
> >>
> >>    VenusCoreCtrl_InitSS(506): un-expected SID override configuration
> >>    WaitForHWidle(462): VENUS is idle, no HW is running
> >>    assert_loop(500): FW Assertion - venusCoreController.c:507
>=20
> Could you please try the usecase with the fix
>=20
> https://lore.kernel.org/all/20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss=
.qualcomm.com/
>=20
> Regards,
> Vikash
>=20
> >>
> >> The first HFI error is 0x05000003. The SFR names the same source line.
> >> Later venus_c2_parsing.c:1550 assertions follow automatic recovery; th=
ey
> >> are not the original failure.
> >>
> >> Could you clarify what the SID override check expects on X1E80100, and
> >> whether there is a known firmware, secure-firmware, or resume-sequenci=
ng
> >> requirement I should check? Which diagnostics would help distinguish a
> >> driver sequencing problem from a firmware requirement? I can test a
> >> targeted diagnostic or patch.
> >
> > Same failure was seen once in windows based X1E80100, and i was informe=
d
> > that doing an explicit GDSC (vcodec) power on before doing a warm boot
> > i.e iris_vpu_boot_firmware() helped the case in windows. I have checked=
,
> > in iris, iris_vpu_power_on() would get the vcodec GDSC on before
> > iris_vpu_boot_firmware().
> >
> > I am gathering more info on SID override configuration part.
> >
> > +ing Renjiang who is helping to debug this issue along with me.
> >
> >>
> >> The firmware is qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn from
> >> linux-firmware-qcom 20260810-2:
> >>
> >>    video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
> >>    PROD, build May 9 2024
> >>    SHA256
> >> 3456a15e01528c2ba2957ef2b78daefd875841b262dc02f0c3bb03c33cba657f
> >>
> >> That hash matches the current linux-firmware main file. The BIOS is
> >> NHCN62WW, dated 12/02/2025. The device tree lists qcom,x1e80100-iris w=
ith
> >> the qcom,sm8550-iris fallback.
> >>
> >> The test repeatedly decodes the same synthetic 1280x720 VP9 clip, 120
> >> frames at normal speed, closes the decoder, verifies runtime_status is
> >> suspended for 100 seconds, then starts again. FFmpeg is 9.0.1 with a
> >> local
> >> fix to requeue empty non-LAST ERROR capture buffers. Successful runs
> >> match every decoded frame against software decoding.
> >
> > Could you please share details on the FFmpeg test and the local fix ? W=
e
> > will repro this locally to get better insight of this issue.
> >
> >>
> >> On one cold boot, three 100-second idle trials with power/control=3Don
> >> passed. After restoring auto, two suspended-idle trials passed and the
> >> third failed. On another boot with auto throughout, two passed and the
> >> third failed. A separate codec guard removed an unnecessary AV1-only
> >> partial buffer from VP9; its warning disappeared, but the fourth
> >> suspended-idle trial still hit the same SID assertion. These compariso=
ns
> >> do not establish runtime PM as the cause or keeping power on as a fix.
> >>
> >> This is a modified test stack, not a pristine-mainline reproduction. T=
he
> >> kernel is 7.2.0-1.1-aarch64-ARCH-camera1, with camera patches. The in-
> >> tree
> >> Iris and video-clock sources were built as external modules. Iris also
> >> has experimental initial-CAPTURE deferral and pre-start buffer ownersh=
ip
> >> changes, a bounded HFI/SFR diagnostic, and Renjiang Han's firmware-
> >> logging
> >> patch with an early debug-queue drain to retain the pre-assertion
> >> messages.
> >> The failing session receives OPEN acknowledgement and its first
> >> compressed
> >> input before the fatal error. No looping or seek is reached.
> >>
> >> Testing stops at the first failure and resumes only after a clean
> >> shutdown
> >> and physical power-on. No clock-module reloads are involved. I can
> >> provide
> >> the synthetic clip, exact source changes and filtered HFI trace if
> >> useful.
> >>
> >> Thanks,
> >> Birk
> >
> > Regards,
> > Vikash
>=20
> 
