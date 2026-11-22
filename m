Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333492;
	b=x5yX/hn8lxbus6LaNiL27SSiP3YoLj0h1xLn+jlpjWX4u2Z/K9KN0iO7fDaR18jUjXOh
	 5IfWK8rVixIJJ4GjZtx4X4NrQDOVgGn8kw3tESlpNhWjB1bJX+5sdfN3zXRFnuk+xXvSp
	 s/5sq4otn9KPkgC0EkVldV0vR0Zs4WA8f4zY5RlzlNWEKKK1gowB/K86d4aaI41TghjlX
	 jwLX1bSq578DfICgpq9RMpkQ3EnRr1YzyhvfQ49EBFD9wRszWvb+QYTLBG8ScjSDLGaOx
	 I7f7wi1vcZxeclO2agj401lfYkd5BCG+4QvetJUUInQCxgTOIuqrGHdwc1NFC/Yk1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=41aq7Q/odxYWtRll/Ido8PrmDSMYdlxmstPU7VScg2I=;
	b=V25nizZ2RlrMGW/QfMKZ1/6kRyRB7pcWKCkORs/FwDDvpIuk4Che+ISbVCWEzfPPOX1V
	 gBj+u+S576JDektW3bBXSW/8DKjisrY40PNJdXu1nStcm2eszVLOm9CnJV6w40kp08NeS
	 ggT+XKIjl/HlUBZAAnuPKeH4XNVDD5V2/SmrvdkdMZ/C+i5uTA+YTmOktKAKmG9ZnX5Ds
	 JyjD4ZgZez6kfHDbEGxiHz8CEIeFcoXMHlH+LDk1slo6VDSPTHOD/iPfN7EIqmLcG340W
	 UPFJgnkYVl2csDzgDCMGlJJ+eKd/i8Iu3NdMCttAAXjymBY6+J8+lnlrmCKl+vyVoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7X5Rd+p;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C1606A32A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661C1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7X5Rd+p
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so2114839e87.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 23:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333490; x=1795938290; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41aq7Q/odxYWtRll/Ido8PrmDSMYdlxmstPU7VScg2I=;
        b=Z7X5Rd+pQJxXdbBxIt936qFnWyPHuZgv6ToTZF9o8i+7fW9lCeef/XVlFnGFRZ6n/2
         1S5VVrmZavWKUoqektKnCEzteboKGyHsdMExO1by03lEiGuRtdiyV/k66OsYPABnr1C+
         qCr53b4W4CvGKfdw/ZPb8sAFzGQkgdaXr2kLNCI4j+JY4RuBeG1KoPdLFz3YyGbTeqJb
         Akl2YpqK0Grak4BrAsTnsr6od8g82cigTnxr63Uss8i1YRfweMFxPU9Vah/GeXd0Yr/w
         sRPVXzV9c5x14MTRtKpBEdWmrsbtL91zNUqAGH8LgJGXx0LoKXfoshnzR93tse9OvO7j
         4ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333490; x=1795938290;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41aq7Q/odxYWtRll/Ido8PrmDSMYdlxmstPU7VScg2I=;
        b=VrWklaKtt334rl9OWoJMzhLYJ9y8lyDLDCUGdCLBvZU5DjMVtrBFk5vmBIsgI0UjAd
         FCqBx4h3K3dRI3qzlygsB9XF7yQtenjzHxW3ryJr6rokiTAJiLoE/Y8S6eJ5rULI+c0N
         VUJ/t+nQLOaNlN67N8CQU4nn9Dw5gu5LBAo3mGXGfgccJgHGBZPLfey5wUceoR0+Aoyc
         Xzx03jeklPB16wkdyMQ4iSxTqYblLoo8nuThfjeK+jmmynE2qmUy52qIAcCYJAX2qBnM
         6i6XRjbaioE4mhjaNSjzImN79TlxGKnehfIxREvEhixVgFKMGj4yUHvmGZ8zeFcGfszy
         QMAw==
X-Forwarded-Encrypted: i=1; AL+hErEL4DuUPQp5LHDMMehUdz+gdG+AiDZuqDtXkaFoSPYlF0KP6xMJ/FwYKg+HlDu40coMJzRTxRZJ1gknEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hYNkbD0V39IijBF7ZW1bW4axMgt95uzwBu43bzOpvJ7kEaS7v
	2Kirllc+eBHMwNJY0vJloYTgNxsCn2SPomOhMOwHCwNP1EIA+TER5FGo
X-Gm-Gg: AZFdTZd6OEtzaY2aLHgHrw4CuM5pWB7jTKqvbV45P1sUUrH7WMm3Pl9Xw78X+SQ01WA
	HELwwenjDR5oM3OJhX9akQbM8Et5/e+VtEbbVNrgRBvdTs4Ml44A61ZIyaiWz3juCXlEEhEvdc3
	DL7uwBrsjlHrqdhXXdgCj/ZuzIz37KTduge7aotZqESXuxzb8JlnD4eHMBwwqohyy9xYSEUzIoE
	ev/Y85n0PRV4dmSs4yhdGYcxyCWkC9RkEozbrQPYtxK4GPcS7f7WIj82vztBLFkveqh1xgS8Dy5
	iTmlFMv9lRsEfoxsc+WaZaUXTUasHYOCu+bRZppCXNdPPv3/Dn2fPGxIEepbO/VqJZn6Et6QYwx
	y+GqF3RbtBklKey0EZ+jsuCVtAVdv/zhD1URfFtW6wb+EYsKLfiXSRtV/e0kxj1+4i4LLMPKlTL
	qjF03K4EXSFuyrDZKJIeiFS1LcXqAcLgQPoIbMhuv1BXeiT607gcNGsyymsbM5duI9Y2dAerxdR
	JPjttLU8JsnGtpQ2zL/g83zfZqnChPWOIV5fbBQVJFmhhKVobT/fCtjRd20F4PDTdpDgdXL2trt
	6VKb9zOFBgU+SP82z0JDYqJ65b876kxRBETw/b4YwToOhegfgzQuj7QGQG54
X-Received: by 2002:a05:6512:ba0:b0:5c1:c107:7477 with SMTP id 2adb3069b0e04-5c1c107755cmr1942269e87.43.1795333490191;
        Sat, 21 Nov 2026 23:44:50 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd07bfdcsm2022134e87.82.2026.11.21.23.44.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Nov 2026 23:44:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <cover.1795191822.git.daniel@makrotopia.org>
Date: Sun, 22 Nov 2026 11:44:32 +0400
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 David Heidelberg <david@ixit.cz>,
 Marc Zyngier <maz@kernel.org>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Dang Huynh <dang.huynh@mainlining.org>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8475BAC-F137-493E-B7AC-9C81FB158610@gmail.com>
References: <cover.1795191822.git.daniel@makrotopia.org>
To: Daniel Golle <daniel@makrotopia.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

> On 20 Nov 2026, at 9:36=E2=80=AFpm, Daniel Golle =
<daniel@makrotopia.org> wrote:
>=20
> This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
> rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
> [1]; in the v2 cover letter he offered to pass the series on. The
> previous posting [2] carried no version in its subject and counts as
> v4.

The original offer was directed at Detlev based on conversations with
other Collabora folks who were hinting that he would be able to (and
it would even be desirable to) fold VDPU346 patches into his work on
VDPU381/383 which was in-flight at the time. However he didn=E2=80=99t =
take
the bait and it didn=E2=80=99t happen. The comment is also pre-Claude =
when my
coding abilities were more rudimentary. The main reason for the long
delay in following up has been the length of time it took for Detlev=E2=80=
=99s
and related DRM series that permit wider testing to land; a vacation
over the summer, and then Claude distracting me with a deep dive into
the Amlogic and Rockchip media stacks that=E2=80=99s resulted in 300+ =
patches
that need a proper plan for upstreaming else I=E2=80=99m going to annoy =
the
already-overworked media/drm maintainers.

I don=E2=80=99t object to someone upstreaming my patches. I do object to =
the
lack of outreach to check on my plans and patch status before blindly
(and wrongly) assuming there were none. You will find later versions
of my patches with fixes for changes in surrounding code (as I work
on something broadly equivalent to drm-tip not Linux 6.18) and from
further testing in my not-very-abandoned development tree:

https://github.com/chewitt/linux/commits/rockchip-7.4.y

=C2=AF\_(=E3=83=84)_/=C2=AF=20

> Patches 1, 2 and 4 are Christian's, with two fixups folded in that v4
> carried as separate patches. Patches 3 and 5 are new since v3 and come
> out of a comparison of the driver with the vendor kernel driver
> (rockchip-linux/kernel develop-6.6, drivers/video/rockchip/mpp) and
> the Rockchip MPP library, followed by conformance runs on hardware.
>=20
> Fluster on a NanoPi R5C (RK3568B2), GStreamer 1.28.7 v4l2sl decoders:
>=20
>  JCT-VC-HEVC_V1   142/147
>  JVT-AVC_V1       129/135
>  JVT-FR-EXT        65/69
>=20
> HEVC failures: PICSIZE_A/B/C/D_Bossen_1 are coded at up to 8440 luma
> samples in one dimension, beyond the 4096x2304 limit of the decoder.
> TSUNEQBD_A_MAIN10_Technicolor_2 has unequal luma and chroma bit depth,
> which the driver rejects for every variant.
>=20
> H.264 failures: CVFC1_Sony_C, FM1_BT_B, FM1_FT_E, SP1_BT_A, sp2_bt_b
> and FM2_SVA_C fail in JVT-AVC_V1; the Hantro G1 of the same board
> fails the same six with the same GStreamer. In JVT-FR-EXT
> Hi422FREXT17_SONY_A, Hi422FREXT19_SONY_A, HPCAMOLQ_BRCM_B and
> HPCVMOLQ_BRCM_B fail; the two BRCM vectors fail on the Hantro G1 as
> well, the two Hi422 intra profile vectors are not understood yet.
>=20
> SAODBLK_A/B_MainConcept_4 and FREH10-1/2 are counted as passes: they
> decode correctly and exceed the default 60 s fluster timeout only
> because the checksum is computed from an uncached mapping of the
> capture buffers.
>=20
> Patch 3 is what makes the score deterministic. With the read caches
> left in their reset state, RAP_B_Bossen_2, WPP_D_ericsson_MAIN_2,
> WPP_D_ericsson_MAIN10_2, WPP_E_ericsson_MAIN_2 (HEVC) and
> CAPM3_Sony_D, MR8_BT_B, MR9_BT_B, NRF_MW_E (H.264) produce wrong
> output in three runs out of three; with the patch they pass in three
> out of three. This is likely the source of the artefacts reported
> against v3. The function is shared with the VDPU381, where the cache
> block is mapped by the binding already. The series has been run on
> the RK3588 as well as on the RK3568.
>=20
> Decode rates with the series: HEVC Main 2160p 92 fps, Main10 2160p
> 77 fps, Main 1080p 380 fps, H.264 High 1080p 197 fps.
>=20
> Patch 5 is kept apart from the node it modifies because the existing
> Tested-by tags were given at the v3 clock rates, and so that it can be
> dropped on its own.
>=20
> On the row and column buffer sizes raised in the v3 review [3]: the
> MPP library uses one vdpu34x HAL with one set of size formulas for the
> RK356x and the RK3588, so the variant keeps vdpu381_rcb_sizes.
>=20
> Known limits, none of them introduced here:
>=20
> - FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
>  and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
>  on this decoder as on the VDPU381 ("Long and short term RPS not
>  set"). The handling of these controls is also the subject of [6].
> - A decode error on such a stream ends in the IOMMU page faults and
>  the oops reported against v3 [4]. The cause is in the error path
>  shared by all variants: the interrupt handler restores the IOMMU
>  while the watchdog is still armed, and the watchdog starts the next
>  job while the IOMMU is detached. "media: rkvdec: Handle interrupts
>  without a current context" [5] covers the oops; the remainder will
>  be addressed separately.
> - The Sashiko review of v4 points out that rkvdec_probe() takes the
>  SRAM pool without a device link to its provider. This predates the
>  series, affects all variants with an sram property and will be sent
>  as a separate fix.

FFmpeg: https://github.com/chewitt/FFmpeg/commits/armsoc-9.0.2/

This contains Jonas' current v4l2_request series plus Detlevs patch
and relevant work on deinterlacing and fixes for issues found from
testing on Allwinner/Amlogic/RPi/Rockchip implementations. We even
started work on UAPI for VC1. Unfortunately we are in a holding pattern
waiting patiently for Jonas to resume his series and fold fixes in
(rather than shanghai the series).

> Patches 3 and 5 were written with the help of an LLM coding assistant,
> which also performed the comparison with the vendor sources. It was
> asked to review the v3 series against the vendor driver and to
> complete it, and for v5 to go through the v4 feedback, fold the fixups
> and revise the commit messages. The conformance and A/B runs above
> were done on the board with builds of v4 on Linux 6.18; v5 differs
> from v4 in the order of two writes to the device tree source and in
> one node name, the driver code is unchanged.

IMHO there is way too much word-salad and blogging the journey in this
cover-letter. Concise text and brevity is a virtue. You should also be
working against a current kernel.

> Changes since v4:
> - Fold "media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions"
>  into "media: rkvdec: Add support for the VDPU346 variant", so that
>  no commit registers 65 element controls
> - Fold "arm64: dts: rockchip: rk356x: Order vdec regs by address" into
>  "arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X"
> - Name the SRAM pool node codec-sram as on the RK3588
> - Read caches: shorten the commit message and state that the cache
>  block is mapped for the VDPU383 as well
> - 400 MHz: state that the rate applies to all streams
> - Cc the reviewers and testers of v3
>=20
> Changes since v3:
> - Add "media: rkvdec: vdpu381: Program the read caches"
> - Add "arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz"
> - Register the HEVC EXT SPS RPS controls with 64 and 32 elements
> - List the vdec register blocks as link, function, cache
> - Add fluster scores and failure analysis
> - Add Tested-by from Diederik de Haas
>=20
> v4: =
https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org
> v3: =
https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.=
com
> v2: =
https://lore.kernel.org/r/20251226113140.573759-1-christianshewitt@gmail.c=
om
>=20
> [1] =
https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.=
com
> [2] =
https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org
> [3] =
https://lore.kernel.org/r/DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com
> [4] =
https://lore.kernel.org/r/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com
> [5] =
https://lore.kernel.org/r/20261026124808.642373-1-a.kazinsky@ideco.ru
> [6] =
https://lore.kernel.org/r/cover.1794645268.git.daniel@makrotopia.org
>=20
> Christian Hewitt (3):
>  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
>  media: rkvdec: Add support for the VDPU346 variant
>  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
>=20
> Daniel Golle (2):
>  media: rkvdec: vdpu381: Program the read caches
>  arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz
>=20
> .../bindings/media/rockchip,vdec.yaml         |   2 +
> arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++
> .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |   2 +
> .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
> .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   9 ++
> .../media/platform/rockchip/rkvdec/rkvdec.c   | 121 ++++++++++++++++++
> .../media/platform/rockchip/rkvdec/rkvdec.h   |   2 +
> 7 files changed, 187 insertions(+)
>=20
>=20
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> --=20
> 2.56.1

