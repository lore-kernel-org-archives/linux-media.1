Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C000501F5F
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542363; cv=pass; b=mXDSuZWcmyGnhggKE96FeO+Br3KiAD6+Yj4YhlA7Ieggup8lqCl+5iUHfpPe43bVkQfTytJ2Fv391SgottMIeCQOf/AuyCm0zYnUBH6/VQ9MGWyXa+U59fGNLbmIhlfpfs79AleAnzLE8faNTNibnmvSXA96iXU0KPs9x9ZUrEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542363; c=relaxed/simple;
	bh=tRkQvJSGj1W8LHv0SvACi6iKmYEXMK5K1tNkGNRgAf4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f6nWmFEayaWXabwObTkAkqUpB/sfNOEkwQ78Pg2lbcVn8nS0376NlTqul5CFA/IexsWhX3+GglRayBpa1F5lXC97PKvVvcRAZOS12corX7+CyGwrQFKw+1fIzkYg7LUhkalkBNmnGIduz7xhH4tJ2LEMK8SnlIjviSavmiG0wk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6uw2DgW; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6uw2DgW"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66fc2844f0eso612598d50.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 10:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788542358; cv=none;
        d=google.com; s=arc-20260327;
        b=ARoGgRpWaA/SyH7fwBuzA+8GgMRU2vflTzPTKGHhwu/ev5AH5Bcz2ziWvpOorW5TeS
         nxH7f/AQ37pjaU6v/81v6hyRicsrOfKA359vqy4X15+fF8DuaRyEXhT+cERQo0VtXRLh
         j33ywXdKSOyWcWf6bTXTt5TBPkZwR+K/mW5If8K2QUp3nGpOAjJNUCmeeTRH0DycyK7f
         XtLHynvF0PYWea8SlbHFfYnBJh/39tH3Hy8qUv9RAOHgs9PIxcYMEI3RDohnan4VA3eb
         IUbE4R1WgwMscS2iqGckXSO6QcDBydBE6QrhMuJkVxlCUJcnIM68u9haqBoyTm4Ytbuk
         +/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=deBxrpqt7wjAnrzEclRm632ZE5N86EZLzhv0m4pleCE=;
        fh=iB68ThnCuyV8AphA7ycOEURwR2Hbs4VsZcg5cDc0Stk=;
        b=Lknw+Si7nrHo6cVZYQb1Q20agZNfzyZZwSt70Jcuhyxwl1sSK8r3Nd/KLRJKumQ9eT
         1NZWqgVgmCjRXLWIRSPI+nN9jRutxumrJx7x4xScBFFeoUwoJR5OZuDeI8ArTW8qMkdg
         e0QJxn6y4GgyEQZhN3+QAsFxILHEJkshcfEQtk7kwOGbabIzS369ulmGoG85y88a6U9Z
         WEmmx772DVq9381x7C3d2wFL9wRAfqUeRiVRPmbg5gEt02w1wwVEE6go7aPUO0hwM3mv
         fvL9HHa4ehR986OUg3Z16HErA2qBEQ4QBn+QulwwiLa71gW1W6QxMN9KfngHObAsdrUg
         GnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788542358; x=1789147158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deBxrpqt7wjAnrzEclRm632ZE5N86EZLzhv0m4pleCE=;
        b=R6uw2DgWEURVER6Wdzx8rfnonvktS6zqXRfW93PKMxsAKHf1GlDVwWBGop+PVtBX8Z
         2Qz1LFMx99ijkXesfuy+QFW4hPswlcg3WBoo+7aegPm6Gb7KdMGbvFY4ph4s02KVdjrc
         SWk+zxfC3hP5zxSSIbV3Z2KSrAhVFax0JP08JQpLIlhhYPIVRCKAORS1ANjQePXLr4wc
         XKxY+7Yx7gaZSnTzu/yDO+kf/0bbJWhq46hGiZECx8/kTZ7Upswa2PavjTRH/HFH2cj4
         AjXT6xPiPoJlOR6ZBkjObBJGYIGEnnFZXUm9SojazsF8ieR0fGddHac5R/yIE88WI5yt
         rXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788542358; x=1789147158;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=deBxrpqt7wjAnrzEclRm632ZE5N86EZLzhv0m4pleCE=;
        b=QDAhVo5VbAbE0vuhES++7hRy9D3Rya4kRAtLPDIqa3jVee6JacPYlwdOmhwbG2rysT
         AXgB2bNAnxc9gqO7Wz6P01WzLFSTZMkeQvxjcmYmXQc+7kw8//wIn85ijvALAqqVQC0Y
         u5ntDdmZpzPuIMbYwi+e/EglxSt7AjhYr9ZarzTJUgjTrvUsg549PxiZ5p1KBIsyaIMo
         UGduoo1Lyfha+KKyznoS6L8RT8o7lyj1mtqpS7sIqS0yGQO/RLEJXQEMZNwZYJJtMyT5
         RpgVtnSs9Xf33diCxMLeSPW1H2ZJYGsBuHeOJlUTglcPskPtabSn70xlLwDQL9mdq+7S
         YiLg==
X-Gm-Message-State: AFuF++k2gwFqZVuv8Hi4C/CQJMhJYj7Ga40xOoh5hfyJb8ynUSrjUQ/d
	26q4jgQV2xapfc1jCiQ4hASkRuG7D7VhphCDqe16rNaMylMTuQkPkxx0kX7WVr8cCYmklePcrDF
	TGv7ZZmN5dYt68B+dgBCLvZmvZNzsnILYqvWmmgE=
X-Gm-Gg: AYBFou3zEqNPJnKjPTVcYtDv9NRc8MSAR2gQAsi6H0EoSZitRzGf+VDhGV004wiFwmq
	uQ2gRkN5h6+0Ddx5BWALc25QfnhWKc5y2rAjA64X3a6g4XYEDqYlTGZg0TahUU95dsDA8XOr8as
	jvF9XoWcpw1/2wGL5YNSTZvlQth+gjZ8aWpBLHWUnysBHz3XMfl8ufb9HFsDOLET3c9yuD55sxq
	SNNIxnpkeTg4DoKaWGrQT0+SKVc5QyXdudU3Y0ms39mM4jQu058/eDqRvMkYWkRvdqaaFdMm517
	A2vIV1/9MfBPG1KskOKvWRupkfb7I3FERDfEUaKP+TFZXEVcXpxvaWsa8m31n+HZShH11Dqjvr/
	Za74=
X-Received: by 2002:a05:690c:a4db:b0:873:5c0f:28e with SMTP id
 00721157ae682-8735c0f0462mr9418127b3.56.1788542357902; Fri, 04 Sep 2026
 10:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Shrikant Bhosale <ishrikantbhosale@gmail.com>
Date: Fri, 4 Sep 2026 22:49:02 +0530
X-Gm-Features: AcwNN1Unl8m3cmakfKX-ZKU8UAyD04DVgIZ1PzAJtB89v9oEEUDS6DOEKW5DgsE
Message-ID: <CANd3ebFdia6RdnopDcSFfv0bpRP=YzeS5GUxDWTWWw0oN5AYnA@mail.gmail.com>
Subject: [REVIEW REQUEST] certification of m2m/vb2 plane-bounds invariants in
 mtk_jpeg, coda, hantro, mxc-jpeg, rkvdec, mtk-vcodec (GKI-reachable)
To: linux-media@vger.kernel.org
Cc: security@kernel.org
Content-Type: multipart/mixed; boundary="000000000000e8d8e1065aab7728"

--000000000000e8d8e1065aab7728
Content-Type: multipart/alternative; boundary="000000000000e8d8de065aab7726"

--000000000000e8d8de065aab7726
Content-Type: text/plain; charset="UTF-8"

*Summary*
-------

This is not a vulnerability report. There is no PoC, no reachable exploit
chain,
and we are NOT asserting any of the listed drivers is vulnerable. Each
driver was
statically closed against a vb2/m2m plane-bounds invariant (plane index <
allocated num_planes, per-plane size check present, loop bound == capacity).
We are asking maintainers to either CONFIRM or REFUTE one precise claim per
driver, because each claim has a concrete counter-example that would
invalidate
it. Both answers are useful to us; either one changes the proof state. Any
UNANSWERED claim remains an OPEN proof obligation -- it is never promoted to
SAFE by the absence of a reply.

*Method (brief)*
--------------
Every claim below reduces to one invariant with a 3-way outcome:
  * CONFIRMED   => maintainer-confirmed invariant: holds at the named
boundary
                   (SAFE at that boundary)
  * REFUTED     => a reachable input violates it (VULNERABLE) -- please
provide
                   the input/PoC that stops at the named line
  * UNANSWERED  => unresolved proof obligation: remains OPEN, NOT folded
into
                   SAFE by silence. It is listed as a live seam until
answered.
We consume only verified primitives. No pattern == proof == vuln == chain
here.

We also recorded tree-level hardening facts that bear on these closures
(arch/arm64/configs/gki_defconfig: CONFIG_CFI=y, CONFIG_FORTIFY_SOURCE=y,
CONFIG_UBSAN_TRAP=y; Makefile: -fno-strict-overflow; CONFIG_LTO not set).
The core question for P9/lowering: does the source-proven invariant survive
Clang -O2? For the runtime-derived-bound closures we have disassembly
showing
the guards retained; for the rest we request confirmation.

*Claims (GKI-reachable set)*
--------------------------

*[1] mtk_jpeg_core.c  (MediaTek JPEG encoder)*
    CLAIM: fb->plane_addr[] is written only for i < dst_buf->num_planes, and
           num_planes <= MTK_JPEG_COMP_MAX(=3) == plane_addr[3] capacity.
    ANCHORS: mtk_jpeg_core.c:907 (comp_num == num_planes check),
             mtk_jpeg_core.c:915 (per-plane vb2_plane_size check)
    REFUTE WITH: a queued JPEG buffer whose comp_num > 3 (or num_planes > 3)
                 passes :907/:915 and reaches the plane_addr[i] write.

*[2] mtk_jpeg_dec_hw.c  (MediaTek JPEG decoder)*
    CLAIM: mtk_jpeg_calc_dst_size() keeps (ds_row_h[3], brz_w[3]) and the
           derived output size within the allocated destination buffer for
any
           JPEG precision/downsample the parser accepts.
    ANCHORS: mtk_jpeg_dec_hw.c:167-170 (u32 ds_row_h[3]; u32 brz_w[3])
    REFUTE WITH: a JPEG whose precision/downsample drives
padding_w/brz_w[i]/
                 ds_row_h[i] past [3] or past the dst buffer. [This one is
                 decompression-field-controlled -- highest residual of the
set;
                 we did NOT close it to SAFE, it is the honest CLASS-C.]

*[3] coda-jpeg.c / coda-bit.c  (Chips Media CODA)*
    CLAIM: plane/bitstream indexing stays within num_planes / FIFO capacity;
           no attacker-chosen index exceeds the allocated plane set or the
           bitstream ring.
    ANCHORS: coda-jpeg.c; coda-bit.c:197,225,2281 (kfifo_in bounded by ring)
    REFUTE WITH: a JPEG frame whose dimensions drive a plane write past the
                 allocated vb2 buffer, or a fill that overruns the
bitstream FIFO.

*[4] hantro_drv.c / hantro_h1_jpeg_enc.c  (Hantro VPU / H1 JPEG)*
    CLAIM: output-plane selection bounded by the queue's num_planes; H1
JPEG is
           constant-plane with per-plane size checks.
    ANCHORS: hantro_drv.c; hantro_h1_jpeg_enc.c
    REFUTE WITH: a compose/crop/format change making the dst index exceed
the
                 queued dst planes.

*[5] mxc-jpeg.c  (NXP i.MX JPEG)*
    CLAIM: plane count and loop bound bracket plane_addr[] allocation.
    ANCHORS: mxc-jpeg.c:612
    REFUTE WITH: a config with more planes than the driver's allocated
capacity.

*[6] rkvdec-hevc-common.c  (Rockchip rkvdec)*
    CLAIM: scaling-list assembly (assemble_scalingdc) copies at most 6
entries
           into list_32x32[6]; the source ranges are bounded by the ctrl
sizes.
    ANCHORS: rkvdec-hevc-common.c:179-181 (u8 list_32x32[6] = {0})
    REFUTE WITH: a HEVC scaling-list ctrl whose dc-coefficient range
exceeds 6
                 (or the ctrl's declared element count exceeds the arrays).

*[7] vdec_*_req*_if.c  (MediaTek stateless H.264/HEVC/VP8/VP9)*
    CLAIM: pic-info / tile parsing (vdec_*_slice_get_pic_info) keeps
frame/size
           fields within the allocated working buffers for any stream the
           stateless ctrl validation accepts.
    ANCHORS: vdec_h264_req_multi_if.c:439, vdec_hevc_req_multi_if.c:682,
             vdec_vp8_req_if.c:120, vdec_vp9_req_lat_if.c:38-471
    REFUTE WITH: a crafted SPS/PPS/tile-bitstream that drives a pic-info
                 structure write past the allocated buffer.

*[8] qcom/camss  (Qualcomm camera)*
    CLAIM: vfe_output buffer-index handling stays within the wm_idx[]
capacity.
    ANCHORS: camss-vfe.h:61 (u8 wm_num; u8 wm_idx[3];)
    REFUTE WITH: a config where wm_num exceeds 3 and wm_idx[] is indexed
beyond
                 the array before a validity check.

*Ask*
---
For each of [1]-[8]: please reply CONFIRMED (maintainer-confirmed invariant,
with a one-line note if the invariant is maintained elsewhere, e.g. in the
v4l2
framework or vb2 core rather than the driver), REFUTED (with the input/PoC
and
the failing step), or leave it UNANSWERED. All eight are treated as OPEN
proof
obligations until answered; UNANSWERED is an unresolved seam, not a SAFE.

Honesty capstone: we have deliberately NOT converted unproven residues into
SAFE or VULNERABLE. The one claim we could not close, [2], is flagged
CLASS-C
(highest residual) and is exactly the one we are most interested in
maintainer
answers on.

Best regards,
*Shrikant Bhosale*

--000000000000e8d8de065aab7726
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><b>Summary</b><br>-------<br><br>This is not a vulnerabili=
ty report. There is no PoC, no reachable exploit chain,<br>and we are NOT a=
sserting any of the listed drivers is vulnerable. Each driver was<br>static=
ally closed against a vb2/m2m plane-bounds invariant (plane index &lt;<br>a=
llocated num_planes, per-plane size check present, loop bound =3D=3D capaci=
ty).<br>We are asking maintainers to either CONFIRM or REFUTE one precise c=
laim per<br>driver, because each claim has a concrete counter-example that =
would invalidate<br>it. Both answers are useful to us; either one changes t=
he proof state. Any<br>UNANSWERED claim remains an OPEN proof obligation --=
 it is never promoted to<br>SAFE by the absence of a reply.<br><br><b>Metho=
d (brief)</b><br>--------------<br>Every claim below reduces to one invaria=
nt with a 3-way outcome:<br>=C2=A0 * CONFIRMED =C2=A0 =3D&gt; maintainer-co=
nfirmed invariant: holds at the named boundary<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(SAFE at that boundary)<br>=C2=
=A0 * REFUTED =C2=A0 =C2=A0 =3D&gt; a reachable input violates it (VULNERAB=
LE) -- please provide<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0the input/PoC that stops at the named line<br>=C2=A0 * =
UNANSWERED =C2=A0=3D&gt; unresolved proof obligation: remains OPEN, NOT fol=
ded into<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SAFE by silence. It is listed as a live seam until answered.<br>We co=
nsume only verified primitives. No pattern =3D=3D proof =3D=3D vuln =3D=3D =
chain here.<br><br>We also recorded tree-level hardening facts that bear on=
 these closures<br>(arch/arm64/configs/gki_defconfig: CONFIG_CFI=3Dy, CONFI=
G_FORTIFY_SOURCE=3Dy,<br>CONFIG_UBSAN_TRAP=3Dy; Makefile: -fno-strict-overf=
low; CONFIG_LTO not set).<br>The core question for P9/lowering: does the so=
urce-proven invariant survive<br>Clang -O2? For the runtime-derived-bound c=
losures we have disassembly showing<br>the guards retained; for the rest we=
 request confirmation.<br><br><b><font size=3D"4">Claims (GKI-reachable set=
)</font></b><br>--------------------------<br><br><b>[1] mtk_jpeg_core.c =
=C2=A0(MediaTek JPEG encoder)</b><br>=C2=A0 =C2=A0 CLAIM: fb-&gt;plane_addr=
[] is written only for i &lt; dst_buf-&gt;num_planes, and<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0num_planes &lt;=3D MTK_JPEG_COMP_MAX(=3D3) =3D=
=3D plane_addr[3] capacity.<br>=C2=A0 =C2=A0 ANCHORS: mtk_jpeg_core.c:907 (=
comp_num =3D=3D num_planes check),<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0mtk_jpeg_core.c:915 (per-plane vb2_plane_size check)<br>=C2=A0=
 =C2=A0 REFUTE WITH: a queued JPEG buffer whose comp_num &gt; 3 (or num_pla=
nes &gt; 3)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0passes :907/:915 and reaches the plane_addr[i] write.<br><br><b>[2] mtk_=
jpeg_dec_hw.c =C2=A0(MediaTek JPEG decoder)</b><br>=C2=A0 =C2=A0 CLAIM: mtk=
_jpeg_calc_dst_size() keeps (ds_row_h[3], brz_w[3]) and the<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0derived output size within the allocated des=
tination buffer for any<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JPEG pr=
ecision/downsample the parser accepts.<br>=C2=A0 =C2=A0 ANCHORS: mtk_jpeg_d=
ec_hw.c:167-170 (u32 ds_row_h[3]; u32 brz_w[3])<br>=C2=A0 =C2=A0 REFUTE WIT=
H: a JPEG whose precision/downsample drives padding_w/brz_w[i]/<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ds_row_h[i] past [3]=
 or past the dst buffer. [This one is<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0decompression-field-controlled -- highest resid=
ual of the set;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0we did NOT close it to SAFE, it is the honest CLASS-C.]<br><br><b>[3]=
 coda-jpeg.c / coda-bit.c =C2=A0(Chips Media CODA)</b><br>=C2=A0 =C2=A0 CLA=
IM: plane/bitstream indexing stays within num_planes / FIFO capacity;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no attacker-chosen index exceeds t=
he allocated plane set or the<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b=
itstream ring.<br>=C2=A0 =C2=A0 ANCHORS: coda-jpeg.c; coda-bit.c:197,225,22=
81 (kfifo_in bounded by ring)<br>=C2=A0 =C2=A0 REFUTE WITH: a JPEG frame wh=
ose dimensions drive a plane write past the<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allocated vb2 buffer, or a fill that over=
runs the bitstream FIFO.<br><b><br>[4] hantro_drv.c / hantro_h1_jpeg_enc.c =
=C2=A0(Hantro VPU / H1 JPEG)</b><br>=C2=A0 =C2=A0 CLAIM: output-plane selec=
tion bounded by the queue&#39;s num_planes; H1 JPEG is<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0constant-plane with per-plane size checks.<br>=C2=
=A0 =C2=A0 ANCHORS: hantro_drv.c; hantro_h1_jpeg_enc.c<br>=C2=A0 =C2=A0 REF=
UTE WITH: a compose/crop/format change making the dst index exceed the<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queued dst pl=
anes.<br><br><b>[5] mxc-jpeg.c =C2=A0(NXP i.MX JPEG)</b><br>=C2=A0 =C2=A0 C=
LAIM: plane count and loop bound bracket plane_addr[] allocation.<br>=C2=A0=
 =C2=A0 ANCHORS: mxc-jpeg.c:612<br>=C2=A0 =C2=A0 REFUTE WITH: a config with=
 more planes than the driver&#39;s allocated capacity.<br><br><b>[6] rkvdec=
-hevc-common.c =C2=A0(Rockchip rkvdec)</b><br>=C2=A0 =C2=A0 CLAIM: scaling-=
list assembly (assemble_scalingdc) copies at most 6 entries<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0into list_32x32[6]; the source ranges are bo=
unded by the ctrl sizes.<br>=C2=A0 =C2=A0 ANCHORS: rkvdec-hevc-common.c:179=
-181 (u8 list_32x32[6] =3D {0})<br>=C2=A0 =C2=A0 REFUTE WITH: a HEVC scalin=
g-list ctrl whose dc-coefficient range exceeds 6<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(or the ctrl&#39;s declared elemen=
t count exceeds the arrays).<br><br><b>[7] vdec_*_req*_if.c =C2=A0(MediaTek=
 stateless H.264/HEVC/VP8/VP9)</b><br>=C2=A0 =C2=A0 CLAIM: pic-info / tile =
parsing (vdec_*_slice_get_pic_info) keeps frame/size<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fields within the allocated working buffers for any=
 stream the<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stateless ctrl vali=
dation accepts.<br>=C2=A0 =C2=A0 ANCHORS: vdec_h264_req_multi_if.c:439, vde=
c_hevc_req_multi_if.c:682,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0vdec_vp8_req_if.c:120, vdec_vp9_req_lat_if.c:38-471<br>=C2=A0 =C2=A0 REF=
UTE WITH: a crafted SPS/PPS/tile-bitstream that drives a pic-info<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0structure write pas=
t the allocated buffer.<br><br><b>[8] qcom/camss =C2=A0(Qualcomm camera)</b=
><br>=C2=A0 =C2=A0 CLAIM: vfe_output buffer-index handling stays within the=
 wm_idx[] capacity.<br>=C2=A0 =C2=A0 ANCHORS: camss-vfe.h:61 (u8 wm_num; u8=
 wm_idx[3];)<br>=C2=A0 =C2=A0 REFUTE WITH: a config where wm_num exceeds 3 =
and wm_idx[] is indexed beyond<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0the array before a validity check.<br><br><b>Ask</b><b=
r>---<br>For each of [1]-[8]: please reply CONFIRMED (maintainer-confirmed =
invariant,<br>with a one-line note if the invariant is maintained elsewhere=
, e.g. in the v4l2<br>framework or vb2 core rather than the driver), REFUTE=
D (with the input/PoC and<br>the failing step), or leave it UNANSWERED. All=
 eight are treated as OPEN proof<br>obligations until answered; UNANSWERED =
is an unresolved seam, not a SAFE.<br><br>Honesty capstone: we have deliber=
ately NOT converted unproven residues into<br>SAFE or VULNERABLE. The one c=
laim we could not close, [2], is flagged CLASS-C<br>(highest residual) and =
is exactly the one we are most interested in maintainer<br>answers on.<br><=
br><div>Best regards,</div><div><b>Shrikant Bhosale</b></div></div>

--000000000000e8d8de065aab7726--
--000000000000e8d8e1065aab7728
Content-Type: text/plain; charset="US-ASCII"; name="VEL_falsifiable_claims_RAW.txt"
Content-Disposition: attachment; filename="VEL_falsifiable_claims_RAW.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mtn7wu1q1>
X-Attachment-Id: f_mtn7wu1q1

ewogICJjbG9zdXJlX2NsYWltcyI6IDI4LAogICJjZXJ0aWZpY2F0aW9uX2RlbWFuZHMgKFNBRkUt
Y2VydGlmaWVkKSI6IDMsCiAgInJlc2lkdWFsX2NsYWltcyAoQ0xBU1MtQywgbmVlZCBkaXNhc3Nl
bWJseSkiOiAyNSwKICAibWF4X3JhdGlvbmFsX2ZhbHNpZmljYXRpb24iOiAiYW55IFJFRlVURUQg
Y2xhaW0gd2l0aCBhIHdvcmtpbmcgUG9DIGlzIHRoZSBvbmx5IHRoaW5nIGEgVlJQIHdvdWxkIGFj
Y2VwdDsgdGhpcyBpbnN0cnVtZW50IGlzIHRoZSBwcmUtUG9DIGZvcmNpbmcgZnVuY3Rpb24uIgp9
CgpGQUxTSUZJQUJMRSBDTEFJTVMgKGNlcnRpZmljYXRpb24gZGVtYW5kcywgbm90IENWRSBjbGFp
bXMpOgoKICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJ
RklFRC1zYWZlKV0gYmFzZS9yZWdtYXAvcmVnbWFwLWkyYy5jCiAgICAgIGRyaXZlciAgICAgICA6
IHJlZ21hcC1pMmMKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxp
c2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0
aGUgZmluZGluZyBhdCBiYXNlL3JlZ21hcC9yZWdtYXAtaTJjLmM6MTc4IGlzIGEgZml4ZWQtc2l6
ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJl
IGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogYmFzZS9yZWdtYXAvcmVnbWFwLWkyYy5j
OjE3OAogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhh
dCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENP
TkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+
IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZp
b2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IGJh
c2UvcmVnbWFwL3JlZ21hcC1pMmMuYzoxNzgKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5
KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIGJhc2UvcmVnbWFwL3JlZ21hcC1pM2Mu
YwogICAgICBkcml2ZXIgICAgICAgOiByZWdtYXAtaTNjCiAgICAgIHJlYWNoYWJpbGl0eSA6IHJl
YWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9uLWRldmljZSkK
ICAgICAgY2xhaW0gICAgICAgIDogdGhlIGZpbmRpbmcgYXQgYmFzZS9yZWdtYXAvcmVnbWFwLWkz
Yy5jOjMxIGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1
cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogYmFz
ZS9yZWdtYXAvcmVnbWFwLWkzYy5jOjMxCiAgICAgIHJlZnV0ZSB3aXRoICA6IGEgdXNlciByZWFj
aGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNs
YXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xh
dGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAgICBSRUZVVEVEICAgICAg
OiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUg
UG9DIHRoYXQgc3RvcHMgYXQgYmFzZS9yZWdtYXAvcmVnbWFwLWkzYy5jOjMxCgogIFtDTEFTUy1D
IChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXSBjaGFy
L2lwbWkvaXBtaV9zaV9pbnRmLmMKICAgICAgZHJpdmVyICAgICAgIDogaXBtaSBzaSBpbnRmCiAg
ICAgIHJlYWNoYWJpbGl0eSA6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUg
Y29uZmlybWVkIG9uLWRldmljZSkKICAgICAgY2xhaW0gICAgICAgIDogdGhlIGZpbmRpbmcgYXQg
Y2hhci9pcG1pL2lwbWlfc2lfaW50Zi5jOjM3NiBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hl
Y2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCiAg
ICAgIGFuY2hvcnMgICAgICA6IGNoYXIvaXBtaS9pcG1pX3NpX2ludGYuYzozNzYKICAgICAgcmVm
dXRlIHdpdGggIDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMg
YWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgogICAgICBDT05GSVJNRUQgICAgOiBu
byByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZp
ZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBW
VUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9wcyBhdCBjaGFyL2lwbWkvaXBtaV9z
aV9pbnRmLmM6Mzc2CgogIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJy
YXkgKFZFUklGSUVELXNhZmUpXSBjaGFyL3JhbmRvbS5jCiAgICAgIGRyaXZlciAgICAgICA6IHJh
bmRvbQogICAgICByZWFjaGFiaWxpdHkgOiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkICht
dXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCiAgICAgIGNsYWltICAgICAgICA6IHRoZSBmaW5k
aW5nIGF0IGNoYXIvcmFuZG9tLmM6MTAzMCBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tl
ZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCiAgICAg
IGFuY2hvcnMgICAgICA6IGNoYXIvcmFuZG9tLmM6MTAzMAogICAgICByZWZ1dGUgd2l0aCAgOiBh
IHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lk
ZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBp
bnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVG
VVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHBy
b3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IGNoYXIvcmFuZG9tLmM6MTAzMAoKICBbcnVudGlt
ZSwgdmFsaWRhdGVkXSBtZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS9jb2RhL2NvZGEtanBlZy5j
CiAgICAgIGRyaXZlciAgICAgICA6IENoaXBzIE1lZGlhIENPREEgSlBFRwogICAgICByZWFjaGFi
aWxpdHkgOiBBbmRyb2lkLUdLSS1yZWFjaGFibGUgbWVkaWEKICAgICAgY2xhaW0gICAgICAgIDog
YnVmZmVyL3BsYW5lIGluZGV4aW5nIHN0YXlzIHdpdGhpbiBudW1fcGxhbmVzIHdpdGggcGVyLXBs
YW5lIHNpemUgY2hlY2tzOyBubyBhdHRhY2tlci1jaG9zZW4gaW5kZXggZXhjZWVkcyB0aGUgYWxs
b2NhdGVkIHBsYW5lIHNldC4KICAgICAgYW5jaG9ycyAgICAgIDogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9jaGlwcy1tZWRpYS9jb2RhL2NvZGEtanBlZy5jCiAgICAgIHJlZnV0ZSB3aXRoICA6IGEg
SlBFRyBzdHJlYW0gd2hvc2UgZnJhbWUgZGltZW5zaW9ucyBkcml2ZSBhIHBsYW5lIHdyaXRlIHBh
c3QgdGhlIGFsbG9jYXRlZCB2YjIgYnVmZmVyLgogICAgICBDT05GSVJNRUQgICAgOiBubyByZWFj
aGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAg
ICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJB
QkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9wcyBhdCBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2NoaXBzLW1lZGlhL2NvZGEvY29kYS1qcGVnLmMKCiAgW25lZWRzIHZlcmlmaWNhdGlvbiAoZGVj
b21wcmVzc2lvbi1jb250cm9sbGVkIGZpZWxkcyldIG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pw
ZWcvbXRrX2pwZWdfZGVjX2h3LmMKICAgICAgZHJpdmVyICAgICAgIDogTWVkaWFUZWsgSlBFRyBk
ZWNvZGVyCiAgICAgIHJlYWNoYWJpbGl0eSA6IEFuZHJvaWQtR0tJLXJlYWNoYWJsZSBtZWRpYQog
ICAgICBjbGFpbSAgICAgICAgOiBkZWNvZGVyIG91dHB1dCBzaXplIGNhbGMgKG10a19qcGVnX2Nh
bGNfZHN0X3NpemUpIGJvdW5kZWQgYnkgYW4gYXR0YWNrZXItY29udHJvbGxhYmxlLWNvbXByZXNz
ZWQtZmllbGQtPmFsbG9jYXRlZC1idWZmZXIgcmVsYXRpb24uCiAgICAgIGFuY2hvcnMgICAgICA6
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYzox
NjctMTcwICh1MzIgZHNfcm93X2hbM10sIGJyel93WzNdKQogICAgICByZWZ1dGUgd2l0aCAgOiBh
IEpQRUcgcHJlY2lzaW9uL2Rvd25zYW1wbGUgY29tYmluYXRpb24gdGhhdCBkcml2ZXMgKHBhZGRp
bmdfdywgYnJ6X3dbaV0sIGRzX3Jvd19oW2ldKSBwYXN0IFszXSBvciBwYXN0IHRoZSBkc3QgYnVm
ZmVyLgogICAgICBDT05GSVJNRUQgICAgOiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhl
IGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNo
YWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhh
dCBzdG9wcyBhdCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
ZGVjX2h3LmM6MTY3LTE3MCAodTMyIGRzX3Jvd19oWzNdLCBicnpfd1szXSkKCiAgW0NMQVNTLUMg
KG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIG1lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0
aV9pZi5jCiAgICAgIGRyaXZlciAgICAgICA6IHZkZWMgaDI2NCByZXEgbXVsdGkgaWYKICAgICAg
cmVhY2hhYmlsaXR5IDogQW5kcm9pZC1HS0ktcmVhY2hhYmxlIG1lZGlhCiAgICAgIGNsYWltICAg
ICAgICA6IHRoZSBmaW5kaW5nIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNv
ZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5jOjQzOSBpcyBhIGZpeGVkLXNpemUgLyBi
b3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0
aWZpZWQuCiAgICAgIGFuY2hvcnMgICAgICA6IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5jOjQzOQogICAgICByZWZ1dGUg
d2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nl
c3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJl
YWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkK
ICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5F
UkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5jOjQzOQoKICBb
Q0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZl
KV0gbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX2hldmNf
cmVxX211bHRpX2lmLmMKICAgICAgZHJpdmVyICAgICAgIDogdmRlYyBoZXZjIHJlcSBtdWx0aSBp
ZgogICAgICByZWFjaGFiaWxpdHkgOiBBbmRyb2lkLUdLSS1yZWFjaGFibGUgbWVkaWEKICAgICAg
Y2xhaW0gICAgICAgIDogdGhlIGZpbmRpbmcgYXQgbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvdmRlYy92ZGVjX2hldmNfcmVxX211bHRpX2lmLmM6NjgyIGlzIGEgZml4ZWQt
c2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0
IGJlIGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX2hldmNfcmVxX211bHRpX2lmLmM6NjgyCiAgICAg
IHJlZnV0ZSB3aXRoICA6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0
aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAg
IDogbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2Vy
dGlmaWVkKQogICAgICBSRUZVVEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQg
LT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92ZGVjX2hldmNfcmVxX211bHRpX2lmLmM6
NjgyCgogIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklG
SUVELXNhZmUpXSBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3Zk
ZWNfdnA4X3JlcV9pZi5jCiAgICAgIGRyaXZlciAgICAgICA6IHZkZWMgdnA4IHJlcSBpZgogICAg
ICByZWFjaGFiaWxpdHkgOiBBbmRyb2lkLUdLSS1yZWFjaGFibGUgbWVkaWEKICAgICAgY2xhaW0g
ICAgICAgIDogdGhlIGZpbmRpbmcgYXQgbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Rl
Y29kZXIvdmRlYy92ZGVjX3ZwOF9yZXFfaWYuYzoxMjAgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRz
LWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVk
LgogICAgICBhbmNob3JzICAgICAgOiBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVj
b2Rlci92ZGVjL3ZkZWNfdnA4X3JlcV9pZi5jOjEyMAogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVz
ZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBp
dHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1
dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRF
RCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3Zp
ZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL3ZkZWMvdmRlY192cDhfcmVxX2lmLmM6MTIwCgogIFtDTEFTUy1DIChuZWVkcyBkaXNh
c3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXSBtZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYwogICAgICBk
cml2ZXIgICAgICAgOiB2ZGVjIHZwOSByZXEgbGF0IGlmCiAgICAgIHJlYWNoYWJpbGl0eSA6IEFu
ZHJvaWQtR0tJLXJlYWNoYWJsZSBtZWRpYQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGlu
ZyBhdCBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5
X3JlcV9sYXRfaWYuYzozOCBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mg
d2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCiAgICAgIGFuY2hvcnMg
ICAgICA6IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192
cDlfcmVxX2xhdF9pZi5jOjM4CiAgICAgIHJlZnV0ZSB3aXRoICA6IGEgdXNlciByZWFjaGFibGUg
aW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBi
b3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIHRo
ZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAgICBSRUZVVEVEICAgICAgOiByZWFj
aGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUgUG9DIHRo
YXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92
ZGVjX3ZwOV9yZXFfbGF0X2lmLmM6MzgKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBv
ciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIG1lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9t
aWNyb2NoaXAtaXNjLWJhc2UuYwogICAgICBkcml2ZXIgICAgICAgOiBtaWNyb2NoaXAtaXNjLWJh
c2UKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVz
dCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGlu
ZyBhdCBtZWRpYS9wbGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlwLWlzYy1iYXNlLmM6MTI1OCBp
cyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJv
cGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCiAgICAgIGFuY2hvcnMgICAgICA6IG1lZGlhL3BsYXRm
b3JtL21pY3JvY2hpcC9taWNyb2NoaXAtaXNjLWJhc2UuYzoxMjU4CiAgICAgIHJlZnV0ZSB3aXRo
ICA6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBv
dXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hh
YmxlIGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAg
ICBSRUZVVEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJM
RTsgcHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vbWljcm9jaGlw
L21pY3JvY2hpcC1pc2MtYmFzZS5jOjEyNTgKCiAgW3J1bnRpbWUsIHZhbGlkYXRlZF0gbWVkaWEv
cGxhdGZvcm0vbnhwL2lteC1qcGVnL214Yy1qcGVnLmMKICAgICAgZHJpdmVyICAgICAgIDogTlhQ
IGkuTVggSlBFRwogICAgICByZWFjaGFiaWxpdHkgOiBBbmRyb2lkLUdLSS1yZWFjaGFibGUgbWVk
aWEKICAgICAgY2xhaW0gICAgICAgIDogbXRrLXN0eWxlOiBwbGFuZSBjb3VudCBhbmQgbG9vcCBi
b3VuZCBicmFja2V0IHBsYW5lX2FkZHJbXSBhbGxvY2F0aW9uLgogICAgICBhbmNob3JzICAgICAg
OiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXgtanBlZy9teGMtanBlZy5jOjYxMgogICAg
ICByZWZ1dGUgd2l0aCAgOiBhIGNvbmZpZyB3aXRoIG1vcmUgcGxhbmVzIHRoYW4gdGhlIGRyaXZl
cidzIGFsbG9jYXRlZCBjYXBhY2l0eS4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hhYmxl
IGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAgICBS
RUZVVEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsg
cHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAv
aW14LWpwZWcvbXhjLWpwZWcuYzo2MTIKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBv
ciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIG1lZGlhL3BsYXRmb3JtL3Fjb20vaXJpcy9p
cmlzX2hmaV9nZW4yX2NvbW1hbmQuYwogICAgICBkcml2ZXIgICAgICAgOiBpcmlzIGhmaSBnZW4y
IGNvbW1hbmQKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hl
ZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUg
ZmluZGluZyBhdCBtZWRpYS9wbGF0Zm9ybS9xY29tL2lyaXMvaXJpc19oZmlfZ2VuMl9jb21tYW5k
LmM6OTkxIGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1
cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogbWVk
aWEvcGxhdGZvcm0vcWNvbS9pcmlzL2lyaXNfaGZpX2dlbjJfY29tbWFuZC5jOjk5MQogICAgICBy
ZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhp
cyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6
IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRp
ZmllZCkKICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+
IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IG1lZGlhL3BsYXRmb3Jt
L3Fjb20vaXJpcy9pcmlzX2hmaV9nZW4yX2NvbW1hbmQuYzo5OTEKCiAgW0NMQVNTLUMgKG5lZWRz
IGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIG1lZGlhL3BsYXRm
b3JtL3JvY2tjaGlwL3JrdmRlYy9ya3ZkZWMtaGV2Yy1jb21tb24uYwogICAgICBkcml2ZXIgICAg
ICAgOiBya3ZkZWMtaGV2Yy1jb21tb24KICAgICAgcmVhY2hhYmlsaXR5IDogQW5kcm9pZC1HS0kt
cmVhY2hhYmxlIG1lZGlhCiAgICAgIGNsYWltICAgICAgICA6IHRoZSBmaW5kaW5nIGF0IG1lZGlh
L3BsYXRmb3JtL3JvY2tjaGlwL3JrdmRlYy9ya3ZkZWMtaGV2Yy1jb21tb24uYzoxODEgaXMgYSBm
aXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5
IG11c3QgYmUgY2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiBtZWRpYS9wbGF0Zm9ybS9y
b2NrY2hpcC9ya3ZkZWMvcmt2ZGVjLWhldmMtY29tbW9uLmM6MTgxCiAgICAgIHJlZnV0ZSB3aXRo
ICA6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBv
dXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hh
YmxlIGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAg
ICBSRUZVVEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJM
RTsgcHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vcm9ja2NoaXAv
cmt2ZGVjL3JrdmRlYy1oZXZjLWNvbW1vbi5jOjE4MQoKICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNz
ZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0gbWVkaWEvcGxhdGZvcm0vdGkv
YW00Mzd4L2FtNDM3eC12cGZlLmMKICAgICAgZHJpdmVyICAgICAgIDogYW00Mzd4LXZwZmUKICAg
ICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBj
b25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGluZyBhdCBt
ZWRpYS9wbGF0Zm9ybS90aS9hbTQzN3gvYW00Mzd4LXZwZmUuYzoxNTggaXMgYSBmaXhlZC1zaXpl
IC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUg
Y2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiBtZWRpYS9wbGF0Zm9ybS90aS9hbTQzN3gv
YW00Mzd4LXZwZmUuYzoxNTgKICAgICAgcmVmdXRlIHdpdGggIDogYSB1c2VyIHJlYWNoYWJsZSBp
bnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJv
dW5kLgogICAgICBDT05GSVJNRUQgICAgOiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhl
IGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNo
YWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhh
dCBzdG9wcyBhdCBtZWRpYS9wbGF0Zm9ybS90aS9hbTQzN3gvYW00Mzd4LXZwZmUuYzoxNTgKCiAg
W0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2Fm
ZSldIG1lZGlhL3BsYXRmb3JtL3RpL3ZwZS92aXAuYwogICAgICBkcml2ZXIgICAgICAgOiB2aXAK
ICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBi
ZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGluZyBh
dCBtZWRpYS9wbGF0Zm9ybS90aS92cGUvdmlwLmM6MzA5IGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5k
cy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmll
ZC4KICAgICAgYW5jaG9ycyAgICAgIDogbWVkaWEvcGxhdGZvcm0vdGkvdnBlL3ZpcC5jOjMwOQog
ICAgICByZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2
ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1F
RCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUg
KGNlcnRpZmllZCkKICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVz
IGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IG1lZGlhL3Bs
YXRmb3JtL3RpL3ZwZS92aXAuYzozMDkKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBv
ciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIHZpZGVvL2ZiZGV2L2Jyb2Fkc2hlZXRmYi5j
CiAgICAgIGRyaXZlciAgICAgICA6IGJyb2Fkc2hlZXRmYgogICAgICByZWFjaGFiaWxpdHkgOiBy
ZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2Up
CiAgICAgIGNsYWltICAgICAgICA6IHRoZSBmaW5kaW5nIGF0IHZpZGVvL2ZiZGV2L2Jyb2Fkc2hl
ZXRmYi5jOjkwNiBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ug
c2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCiAgICAgIGFuY2hvcnMgICAgICA6
IHZpZGVvL2ZiZGV2L2Jyb2Fkc2hlZXRmYi5jOjkwNgogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVz
ZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBp
dHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1
dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRF
RCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3Zp
ZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IHZpZGVvL2ZiZGV2L2Jyb2Fkc2hlZXRmYi5jOjkwNgoK
ICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1z
YWZlKV0gdmlkZW8vZmJkZXYvbWF0cm94L2c0NTBfcGxsLmMKICAgICAgZHJpdmVyICAgICAgIDog
ZzQ1MCBwbGwKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hl
ZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUg
ZmluZGluZyBhdCB2aWRlby9mYmRldi9tYXRyb3gvZzQ1MF9wbGwuYzoyNjIgaXMgYSBmaXhlZC1z
aXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3Qg
YmUgY2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiB2aWRlby9mYmRldi9tYXRyb3gvZzQ1
MF9wbGwuYzoyNjIKICAgICAgcmVmdXRlIHdpdGggIDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBw
YXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgog
ICAgICBDT05GSVJNRUQgICAgOiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFy
aWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJsZSBp
bnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9w
cyBhdCB2aWRlby9mYmRldi9tYXRyb3gvZzQ1MF9wbGwuYzoyNjIKCiAgW0NMQVNTLUMgKG5lZWRz
IGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIHZpZGVvL2ZiZGV2
L21hdHJveC9tYXRyb3hmYl9taXNjLmMKICAgICAgZHJpdmVyICAgICAgIDogbWF0cm94ZmIgbWlz
YwogICAgICByZWFjaGFiaWxpdHkgOiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0
IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCiAgICAgIGNsYWltICAgICAgICA6IHRoZSBmaW5kaW5n
IGF0IHZpZGVvL2ZiZGV2L21hdHJveC9tYXRyb3hmYl9taXNjLmM6NTEwIGlzIGEgZml4ZWQtc2l6
ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJl
IGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogdmlkZW8vZmJkZXYvbWF0cm94L21hdHJv
eGZiX21pc2MuYzo1MTAKICAgICAgcmVmdXRlIHdpdGggIDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1
dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5k
LgogICAgICBDT05GSVJNRUQgICAgOiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGlu
dmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJs
ZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBz
dG9wcyBhdCB2aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJfbWlzYy5jOjUxMAoKICBbQ0xBU1Mt
QyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0gdmlk
ZW8vZmJkZXYvbWI4NjJ4eC9tYjg2Mnh4ZmJfYWNjZWwuYwogICAgICBkcml2ZXIgICAgICAgOiBt
Yjg2Mnh4ZmIgYWNjZWwKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3Rh
Ymxpc2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAg
OiB0aGUgZmluZGluZyBhdCB2aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jOjQz
IGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBw
cm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogdmlkZW8vZmJk
ZXYvbWI4NjJ4eC9tYjg2Mnh4ZmJfYWNjZWwuYzo0MwogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVz
ZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBp
dHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1
dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRF
RCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3Zp
ZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IHZpZGVvL2ZiZGV2L21iODYyeHgvbWI4NjJ4eGZiX2Fj
Y2VsLmM6NDMKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAo
VkVSSUZJRUQtc2FmZSldIHZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1k
c2ktY20uYwogICAgICBkcml2ZXIgICAgICAgOiBwYW5lbC1kc2ktY20KICAgICAgcmVhY2hhYmls
aXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24t
ZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGluZyBhdCB2aWRlby9mYmRldi9v
bWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtZHNpLWNtLmM6MTk5IGlzIGEgZml4ZWQtc2l6ZSAv
IGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNl
cnRpZmllZC4KICAgICAgYW5jaG9ycyAgICAgIDogdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rp
c3BsYXlzL3BhbmVsLWRzaS1jbS5jOjE5OQogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVh
Y2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVj
bGFyZWQgYm91bmQuCiAgICAgIENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9s
YXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRFRCAgICAg
IDogcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhl
IFBvQyB0aGF0IHN0b3BzIGF0IHZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5l
bC1kc2ktY20uYzoxOTkKCiAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1h
cnJheSAoVkVSSUZJRUQtc2FmZSldIHZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9w
YW5lbC10cG8tdGQwMjh0dGVjMS5jCiAgICAgIGRyaXZlciAgICAgICA6IHBhbmVsLXRwby10ZDAy
OHR0ZWMxCiAgICAgIHJlYWNoYWJpbGl0eSA6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQg
KG11c3QgYmUgY29uZmlybWVkIG9uLWRldmljZSkKICAgICAgY2xhaW0gICAgICAgIDogdGhlIGZp
bmRpbmcgYXQgdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDAy
OHR0ZWMxLmM6NzEgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3Nl
IHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAg
OiB2aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtdHBvLXRkMDI4dHRlYzEu
Yzo3MQogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhh
dCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAgIENP
TkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+
IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0IHZp
b2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IHZp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5jOjcx
CgogIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVE
LXNhZmUpXSB2aWRlby9mYmRldi9weGFmYi5jCiAgICAgIGRyaXZlciAgICAgICA6IHB4YWZiCiAg
ICAgIHJlYWNoYWJpbGl0eSA6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUg
Y29uZmlybWVkIG9uLWRldmljZSkKICAgICAgY2xhaW0gICAgICAgIDogdGhlIGZpbmRpbmcgYXQg
dmlkZW8vZmJkZXYvcHhhZmIuYzoxOTA0IGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2Vk
IGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KICAgICAg
YW5jaG9ycyAgICAgIDogdmlkZW8vZmJkZXYvcHhhZmIuYzoxOTA0CiAgICAgIHJlZnV0ZSB3aXRo
ICA6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBv
dXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hh
YmxlIGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAg
ICBSRUZVVEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJM
RTsgcHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgdmlkZW8vZmJkZXYvcHhhZmIuYzoxOTA0
CgogIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVE
LXNhZmUpXSBtZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS5oCiAgICAgIGRyaXZl
ciAgICAgICA6IGNhbXNzLXZmZS5oCiAgICAgIHJlYWNoYWJpbGl0eSA6IEFuZHJvaWQtR0tJLXJl
YWNoYWJsZSBtZWRpYQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGluZyBhdCBtZWRpYS9w
bGF0Zm9ybS9xY29tL2NhbXNzL2NhbXNzLXZmZS5oOjYxIGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5k
cy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmll
ZC4KICAgICAgYW5jaG9ycyAgICAgIDogbWVkaWEvcGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12
ZmUuaDo2MQogICAgICByZWZ1dGUgd2l0aCAgOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGgg
dGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCiAgICAg
IENPTkZJUk1FRCAgICA6IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50
IC0+IFNBRkUgKGNlcnRpZmllZCkKICAgICAgUkVGVVRFRCAgICAgIDogcmVhY2hhYmxlIGlucHV0
IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0
IG1lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmg6NjEKCiAgW0NMQVNTLUMgKG5l
ZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIG1lZGlhL3Bs
YXRmb3JtL3N0L3N0bTMyL2RtYTJkL2RtYTJkLmgKICAgICAgZHJpdmVyICAgICAgIDogZG1hMmQu
aAogICAgICByZWFjaGFiaWxpdHkgOiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0
IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCiAgICAgIGNsYWltICAgICAgICA6IHRoZSBmaW5kaW5n
IGF0IG1lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL2RtYTJkL2RtYTJkLmg6NzggaXMgYSBmaXhlZC1z
aXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3Qg
YmUgY2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiBtZWRpYS9wbGF0Zm9ybS9zdC9zdG0z
Mi9kbWEyZC9kbWEyZC5oOjc4CiAgICAgIHJlZnV0ZSB3aXRoICA6IGEgdXNlciByZWFjaGFibGUg
aW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBi
b3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIHRo
ZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAgICBSRUZVVEVEICAgICAgOiByZWFj
aGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUgUG9DIHRo
YXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvZG1hMmQvZG1hMmQuaDo3OAoKICBb
Q0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZl
KV0gbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vcm9ja2NoaXBfYXYxX2VudHJvcHltb2RlLmgK
ICAgICAgZHJpdmVyICAgICAgIDogcm9ja2NoaXAgYXYxIGVudHJvcHltb2RlLmgKICAgICAgcmVh
Y2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBjb25maXJt
ZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmluZGluZyBhdCBtZWRpYS9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9yb2NrY2hpcF9hdjFfZW50cm9weW1vZGUuaDoyMDMgaXMgYSBm
aXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5
IG11c3QgYmUgY2VydGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiBtZWRpYS9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9yb2NrY2hpcF9hdjFfZW50cm9weW1vZGUuaDoyMDMKICAgICAgcmVmdXRlIHdp
dGggIDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNz
IG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgogICAgICBDT05GSVJNRUQgICAgOiBubyByZWFj
aGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCiAg
ICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJB
QkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9wcyBhdCBtZWRpYS9wbGF0Zm9ybS92ZXJpc2ls
aWNvbi9yb2NrY2hpcF9hdjFfZW50cm9weW1vZGUuaDoyMDMKCiAgW0NMQVNTLUMgKG5lZWRzIGRp
c2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldIHZpZGVvL2ZiZGV2L2Nv
bnRyb2xmYi5oCiAgICAgIGRyaXZlciAgICAgICA6IGNvbnRyb2xmYi5oCiAgICAgIHJlYWNoYWJp
bGl0eSA6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9u
LWRldmljZSkKICAgICAgY2xhaW0gICAgICAgIDogdGhlIGZpbmRpbmcgYXQgdmlkZW8vZmJkZXYv
Y29udHJvbGZiLmg6MTAwIGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3
aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KICAgICAgYW5jaG9ycyAg
ICAgIDogdmlkZW8vZmJkZXYvY29udHJvbGZiLmg6MTAwCiAgICAgIHJlZnV0ZSB3aXRoICA6IGEg
dXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRl
IGl0cyBkZWNsYXJlZCBib3VuZC4KICAgICAgQ09ORklSTUVEICAgIDogbm8gcmVhY2hhYmxlIGlu
cHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQogICAgICBSRUZV
VEVEICAgICAgOiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJv
dmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgdmlkZW8vZmJkZXYvY29udHJvbGZiLmg6MTAwCgog
IFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNh
ZmUpXSB2aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuaAogICAgICBkcml2ZXIgICAgICAgOiByaXZh
IGh3LmgKICAgICAgcmVhY2hhYmlsaXR5IDogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAo
bXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQogICAgICBjbGFpbSAgICAgICAgOiB0aGUgZmlu
ZGluZyBhdCB2aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuaDozNjYgaXMgYSBmaXhlZC1zaXplIC8g
Ym91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2Vy
dGlmaWVkLgogICAgICBhbmNob3JzICAgICAgOiB2aWRlby9mYmRldi9yaXZhL3JpdmFfaHcuaDoz
NjYKICAgICAgcmVmdXRlIHdpdGggIDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQg
ZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgogICAgICBDT05G
SVJNRUQgICAgOiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFyaWFudCAtPiBT
QUZFIChjZXJ0aWZpZWQpCiAgICAgIFJFRlVURUQgICAgICA6IHJlYWNoYWJsZSBpbnB1dCB2aW9s
YXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9wcyBhdCB2aWRl
by9mYmRldi9yaXZhL3JpdmFfaHcuaDozNjYK
--000000000000e8d8e1065aab7728
Content-Type: text/markdown; charset="UTF-8"; name="VEL_falsifiable_claims.md"
Content-Disposition: attachment; filename="VEL_falsifiable_claims.md"
Content-Transfer-Encoding: base64
Content-ID: <f_mtn7wu0z0>
X-Attachment-Id: f_mtn7wu0z0

IyBWRUwg4oCUIEZhbHNpZmlhYmxlIENsYWltcyBJbnN0cnVtZW50IChwcmVzc3VyZSwgbm90IENW
RSkKCj4gT25lIHByZWNpc2UsIGZhbHNpZmlhYmxlIGNsYWltIHBlciBhdWRpdC1jbG9zdXJlLiBF
YWNoIGNsYWltIG5hbWVzIHRoZQo+IHJlYWwgaW52YXJpYW50LCB0aGUgcmVhbCBldmlkZW5jZSBh
bmNob3JzIChmaWxlOmxpbmUpLCBhbmQgdGhlIEVYQUNUCj4gY291bnRlci1leGFtcGxlIHRoYXQg
d291bGQgcmVmdXRlIGl0LiBUaGUgYWRkcmVzc2VlIG11c3QgYW5zd2VyCj4gQ09ORklSTUVEIChj
ZXJ0aWZ5IFNBRkUpIG9yIFJFRlVURUQgKHByb2R1Y2UgdGhlIHN0b3BwaW5nIFBvQykuCj4gVGhp
cyBpcyBhIGNlcnRpZmljYXRpb24gZGVtYW5kIHdpdGggYSBwcmVjaXNlIGJpc2VjdGlvbiDigJQg
bm90IGFuCj4gYXNzZXJ0aW9uIHRoYXQgdGhlIGRyaXZlciBpcyB2dWxuZXJhYmxlLCBhbmQgbm90
IGEgaGlkZGVuIENWRS4KCkRpc2NpcGxpbmU6IGBwYXR0ZXJuICE9IHByb29mICE9IHZ1bG5lcmFi
aWxpdHkgIT0gZXhwbG9pdCBjaGFpbmAuIENsYWltcwpjb25zdW1lIG9ubHkgVkVSSUZJRUQgcHJp
bWl0aXZlcy4gQSBjbGFpbSBpcyBsb2FkLWJlYXJpbmcgb25seSBpZiBib3RoCmFuc3dlcnMgY2hh
bmdlIHRoZSByaXNrIHBpY3R1cmUuCgojIyBCYWNraW5nIGhhcmRlbmluZyBmYWN0cyAobWVhc3Vy
ZWQgZnJvbSB0aGUgcmVhbCB0cmVlLCBub3QgYXNzZXJ0ZWQpCgotIGBDT05GSUdfQ0ZJPXlgLCBg
Q09ORklHX0ZPUlRJRllfU09VUkNFPXlgLCBgQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZPXlgLAog
IGBDT05GSUdfVUJTQU49eWArYENPTkZJR19VQlNBTl9UUkFQPXlgIChhcmNoL2FybTY0L2NvbmZp
Z3MvZ2tpX2RlZmNvbmZpZykKLSBgTWFrZWZpbGU6MTE3MiAtZm5vLXN0cmljdC1vdmVyZmxvd2A7
IGBDT05GSUdfTFRPYCBOT1Qgc2V0IGluIEdLSSBkZWZjb25maWcKLSBDbGFuZy9MTFZNIGlzIHRo
ZSBBbmRyb2lkIEdLSSB0b29sY2hhaW4gKGdjYyBkcm9wcGVkIGZyb20gQW5kcm9pZCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KCiMjIEEuIEFuZHJvaWQtR0tJLXJlYWNoYWJsZSBjbGFpbXMgKDkpClRoZXNlIGJp
bmQgdG8gc2hpcHBpbmcgQW5kcm9pZCBrZXJuZWxzIGZpcnN0LgoKIyMjIEExLiBtZWRpYS9wbGF0
Zm9ybS9jaGlwcy1tZWRpYS9jb2RhL2NvZGEtanBlZy5jICBbcnVudGltZSwgdmFsaWRhdGVkXQot
IGRyaXZlcjogQ2hpcHMgTWVkaWEgQ09EQSBKUEVHCi0gQ0xBSU06IGJ1ZmZlci9wbGFuZSBpbmRl
eGluZyBzdGF5cyB3aXRoaW4gbnVtX3BsYW5lcyB3aXRoIHBlci1wbGFuZSBzaXplIGNoZWNrczsg
bm8gYXR0YWNrZXItY2hvc2VuIGluZGV4IGV4Y2VlZHMgdGhlIGFsbG9jYXRlZCBwbGFuZSBzZXQu
Ci0gZXZpZGVuY2U6IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvY29kYS9jb2Rh
LWpwZWcuYwotIHJlZnV0ZSB3aXRoOiBhIEpQRUcgc3RyZWFtIHdob3NlIGZyYW1lIGRpbWVuc2lv
bnMgZHJpdmUgYSBwbGFuZSB3cml0ZSBwYXN0IHRoZSBhbGxvY2F0ZWQgdmIyIGJ1ZmZlci4KLSBD
T05GSVJNRUQgLT4gbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4g
U0FGRSAoY2VydGlmaWVkKQotIFJFRlVURUQgICAtPiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMg
aXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUgUG9DIHRoYXQgc3RvcHMgYXQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS9jb2RhL2NvZGEtanBlZy5jCgojIyMgQTIuIG1lZGlh
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMgIFtuZWVkcyB2ZXJpZmlj
YXRpb24gKGRlY29tcHJlc3Npb24tY29udHJvbGxlZCBmaWVsZHMpXQotIGRyaXZlcjogTWVkaWFU
ZWsgSlBFRyBkZWNvZGVyCi0gQ0xBSU06IGRlY29kZXIgb3V0cHV0IHNpemUgY2FsYyAobXRrX2pw
ZWdfY2FsY19kc3Rfc2l6ZSkgYm91bmRlZCBieSBhbiBhdHRhY2tlci1jb250cm9sbGFibGUtY29t
cHJlc3NlZC1maWVsZC0+YWxsb2NhdGVkLWJ1ZmZlciByZWxhdGlvbi4KLSBldmlkZW5jZTogZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jOjE2Ny0x
NzAgKHUzMiBkc19yb3dfaFszXSwgYnJ6X3dbM10pCi0gcmVmdXRlIHdpdGg6IGEgSlBFRyBwcmVj
aXNpb24vZG93bnNhbXBsZSBjb21iaW5hdGlvbiB0aGF0IGRyaXZlcyAocGFkZGluZ193LCBicnpf
d1tpXSwgZHNfcm93X2hbaV0pIHBhc3QgWzNdIG9yIHBhc3QgdGhlIGRzdCBidWZmZXIuCi0gQ09O
RklSTUVEIC0+IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNB
RkUgKGNlcnRpZmllZCkKLSBSRUZVVEVEICAgLT4gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0
IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYzoxNjctMTcwICh1MzIg
ZHNfcm93X2hbM10sIGJyel93WzNdKQoKIyMjIEEzLiBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVsdGlfaWYuYyAgW0NMQVNTLUMgKG5l
ZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldCi0gZHJpdmVy
OiB2ZGVjIGgyNjQgcmVxIG11bHRpIGlmCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IG1lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9p
Zi5jOjQzOSBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2Vj
dXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRm
b3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5j
OjQzOQotIHJlZnV0ZSB3aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2
ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCi0gQ09ORklSTUVEIC0+
IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRp
ZmllZCkKLSBSRUZVVEVEICAgLT4gcmVhY2hhYmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5F
UkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY19oMjY0X3JlcV9tdWx0aV9pZi5jOjQzOQoKIyMj
IEE0LiBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfaGV2
Y19yZXFfbXVsdGlfaWYuYyAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1h
cnJheSAoVkVSSUZJRUQtc2FmZSldCi0gZHJpdmVyOiB2ZGVjIGhldmMgcmVxIG11bHRpIGlmCi0g
Q0xBSU06IHRoZSBmaW5kaW5nIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNv
ZGVyL3ZkZWMvdmRlY19oZXZjX3JlcV9tdWx0aV9pZi5jOjY4MiBpcyBhIGZpeGVkLXNpemUgLyBi
b3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0
aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVy
L3ZkZWMvdmRlY19oZXZjX3JlcV9tdWx0aV9pZi5jOjY4MgotIHJlZnV0ZSB3aXRoOiBhIHVzZXIg
cmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMg
ZGVjbGFyZWQgYm91bmQuCi0gQ09ORklSTUVEIC0+IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRl
cyB0aGUgaW52YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKLSBSRUZVVEVEICAgLT4gcmVhY2hh
YmxlIGlucHV0IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0
IHN0b3BzIGF0IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRl
Y19oZXZjX3JlcV9tdWx0aV9pZi5jOjY4MgoKIyMjIEE1LiBtZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA4X3JlcV9pZi5jICBbQ0xBU1MtQyAobmVlZHMg
ZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IHZk
ZWMgdnA4IHJlcSBpZgotIENMQUlNOiB0aGUgZmluZGluZyBhdCBtZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA4X3JlcV9pZi5jOjEyMCBpcyBhIGZpeGVk
LXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVz
dCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9kZWNvZGVyL3ZkZWMvdmRlY192cDhfcmVxX2lmLmM6MTIwCi0gcmVmdXRlIHdpdGg6IGEgdXNl
ciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0
cyBkZWNsYXJlZCBib3VuZC4KLSBDT05GSVJNRUQgLT4gbm8gcmVhY2hhYmxlIGlucHV0IHZpb2xh
dGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQotIFJFRlVURUQgICAtPiByZWFj
aGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0aGUgUG9DIHRo
YXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29kZXIvdmRlYy92
ZGVjX3ZwOF9yZXFfaWYuYzoxMjAKCiMjIyBBNi4gbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNv
ZGVjL2RlY29kZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmMgIFtDTEFTUy1DIChuZWVkcyBk
aXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXQotIGRyaXZlcjogdmRl
YyB2cDkgcmVxIGxhdCBpZgotIENMQUlNOiB0aGUgZmluZGluZyBhdCBtZWRpYS9wbGF0Zm9ybS9t
ZWRpYXRlay92Y29kZWMvZGVjb2Rlci92ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYzozOCBpcyBh
IGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVy
dHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L3Zjb2RlYy9kZWNvZGVyL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jOjM4Ci0gcmVmdXRlIHdp
dGg6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBv
dXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KLSBDT05GSVJNRUQgLT4gbm8gcmVhY2hhYmxlIGlu
cHV0IHZpb2xhdGVzIHRoZSBpbnZhcmlhbnQgLT4gU0FGRSAoY2VydGlmaWVkKQotIFJFRlVURUQg
ICAtPiByZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgaXQgLT4gVlVMTkVSQUJMRTsgcHJvdmlkZSB0
aGUgUG9DIHRoYXQgc3RvcHMgYXQgbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2RlY29k
ZXIvdmRlYy92ZGVjX3ZwOV9yZXFfbGF0X2lmLmM6MzgKCiMjIyBBNy4gbWVkaWEvcGxhdGZvcm0v
bnhwL2lteC1qcGVnL214Yy1qcGVnLmMgIFtydW50aW1lLCB2YWxpZGF0ZWRdCi0gZHJpdmVyOiBO
WFAgaS5NWCBKUEVHCi0gQ0xBSU06IG10ay1zdHlsZTogcGxhbmUgY291bnQgYW5kIGxvb3AgYm91
bmQgYnJhY2tldCBwbGFuZV9hZGRyW10gYWxsb2NhdGlvbi4KLSBldmlkZW5jZTogZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14LWpwZWcvbXhjLWpwZWcuYzo2MTIKLSByZWZ1dGUgd2l0aDog
YSBjb25maWcgd2l0aCBtb3JlIHBsYW5lcyB0aGFuIHRoZSBkcml2ZXIncyBhbGxvY2F0ZWQgY2Fw
YWNpdHkuCi0gQ09ORklSTUVEIC0+IG5vIHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyB0aGUgaW52
YXJpYW50IC0+IFNBRkUgKGNlcnRpZmllZCkKLSBSRUZVVEVEICAgLT4gcmVhY2hhYmxlIGlucHV0
IHZpb2xhdGVzIGl0IC0+IFZVTE5FUkFCTEU7IHByb3ZpZGUgdGhlIFBvQyB0aGF0IHN0b3BzIGF0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteC1qcGVnL214Yy1qcGVnLmM6NjEyCgojIyMg
QTguIG1lZGlhL3BsYXRmb3JtL3JvY2tjaGlwL3JrdmRlYy9ya3ZkZWMtaGV2Yy1jb21tb24uYyAg
W0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2Fm
ZSldCi0gZHJpdmVyOiBya3ZkZWMtaGV2Yy1jb21tb24KLSBDTEFJTTogdGhlIGZpbmRpbmcgYXQg
bWVkaWEvcGxhdGZvcm0vcm9ja2NoaXAvcmt2ZGVjL3JrdmRlYy1oZXZjLWNvbW1vbi5jOjE4MSBp
cyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJv
cGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL3JvY2tj
aGlwL3JrdmRlYy9ya3ZkZWMtaGV2Yy1jb21tb24uYzoxODEKLSByZWZ1dGUgd2l0aDogYSB1c2Vy
IHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRz
IGRlY2xhcmVkIGJvdW5kLgotIENPTkZJUk1FRCAtPiBubyByZWFjaGFibGUgaW5wdXQgdmlvbGF0
ZXMgdGhlIGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQpCi0gUkVGVVRFRCAgIC0+IHJlYWNo
YWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxFOyBwcm92aWRlIHRoZSBQb0MgdGhh
dCBzdG9wcyBhdCBtZWRpYS9wbGF0Zm9ybS9yb2NrY2hpcC9ya3ZkZWMvcmt2ZGVjLWhldmMtY29t
bW9uLmM6MTgxCgojIyMgQTkuIG1lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmgg
IFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNh
ZmUpXQotIGRyaXZlcjogY2Ftc3MtdmZlLmgKLSBDTEFJTTogdGhlIGZpbmRpbmcgYXQgbWVkaWEv
cGxhdGZvcm0vcWNvbS9jYW1zcy9jYW1zcy12ZmUuaDo2MSBpcyBhIGZpeGVkLXNpemUgLyBib3Vu
ZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZp
ZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL3Fjb20vY2Ftc3MvY2Ftc3MtdmZlLmg6NjEK
LSByZWZ1dGUgd2l0aDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRo
aXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgotIENPTkZJUk1FRCAtPiBubyBy
ZWFjaGFibGUgaW5wdXQgdmlvbGF0ZXMgdGhlIGludmFyaWFudCAtPiBTQUZFIChjZXJ0aWZpZWQp
Ci0gUkVGVVRFRCAgIC0+IHJlYWNoYWJsZSBpbnB1dCB2aW9sYXRlcyBpdCAtPiBWVUxORVJBQkxF
OyBwcm92aWRlIHRoZSBQb0MgdGhhdCBzdG9wcyBhdCBtZWRpYS9wbGF0Zm9ybS9xY29tL2NhbXNz
L2NhbXNzLXZmZS5oOjYxCgoKIyMgQi4gUmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAvIHJl
c3RyaWN0ZWQgKDE5KQpUaGVzZSBhcmUgbGlzdGVkIGZvciBjb21wbGV0ZW5lc3M7IGEgZGV2aWNl
IG11c3QgYmUgY29uZmlybWVkIGJlZm9yZSB0aGUKY2xhaW0gYmluZHMuIFRoZXkgYXJlIE5PVCBw
cmVzZW50ZWQgYXMgcmVhY2hhYmxlIEFuZHJvaWQgYnVncy4KCiMjIyBCMS4gYmFzZS9yZWdtYXAv
cmVnbWFwLWkyYy5jICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5
IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IHJlZ21hcC1pMmMKLSByZWFjaGFiaWxpdHk6IHJl
YWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9uLWRldmljZSkK
LSBDTEFJTTogdGhlIGZpbmRpbmcgYXQgYmFzZS9yZWdtYXAvcmVnbWFwLWkyYy5jOjE3OCBpcyBh
IGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVy
dHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IGJhc2UvcmVnbWFwL3JlZ21hcC1pMmMu
YzoxNzgKLSByZWZ1dGUgd2l0aDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJp
dmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgoKIyMjIEIyLiBiYXNl
L3JlZ21hcC9yZWdtYXAtaTNjLmMgIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4
ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXQotIGRyaXZlcjogcmVnbWFwLWkzYwotIHJlYWNoYWJp
bGl0eTogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24t
ZGV2aWNlKQotIENMQUlNOiB0aGUgZmluZGluZyBhdCBiYXNlL3JlZ21hcC9yZWdtYXAtaTNjLmM6
MzEgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5
IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiBiYXNlL3JlZ21hcC9yZWdt
YXAtaTNjLmM6MzEKLSByZWZ1dGUgd2l0aDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRo
YXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgoKIyMjIEIz
LiBjaGFyL2lwbWkvaXBtaV9zaV9pbnRmLmMgIFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkg
b3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXQotIGRyaXZlcjogaXBtaSBzaSBpbnRmCi0g
cmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZp
cm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IGNoYXIvaXBtaS9pcG1pX3Np
X2ludGYuYzozNzYgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3Nl
IHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiBjaGFyL2lw
bWkvaXBtaV9zaV9pbnRmLmM6Mzc2Ci0gcmVmdXRlIHdpdGg6IGEgdXNlciByZWFjaGFibGUgaW5w
dXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3Vu
ZC4KCiMjIyBCNC4gY2hhci9yYW5kb20uYyAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBv
ciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldCi0gZHJpdmVyOiByYW5kb20KLSByZWFjaGFi
aWxpdHk6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9u
LWRldmljZSkKLSBDTEFJTTogdGhlIGZpbmRpbmcgYXQgY2hhci9yYW5kb20uYzoxMDMwIGlzIGEg
Zml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0
eSBtdXN0IGJlIGNlcnRpZmllZC4KLSBldmlkZW5jZTogY2hhci9yYW5kb20uYzoxMDMwCi0gcmVm
dXRlIHdpdGg6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFj
Y2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KCiMjIyBCNS4gbWVkaWEvcGxhdGZvcm0v
bWljcm9jaGlwL21pY3JvY2hpcC1pc2MtYmFzZS5jICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1i
bHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IG1pY3JvY2hpcC1p
c2MtYmFzZQotIHJlYWNoYWJpbGl0eTogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVz
dCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQotIENMQUlNOiB0aGUgZmluZGluZyBhdCBtZWRpYS9w
bGF0Zm9ybS9taWNyb2NoaXAvbWljcm9jaGlwLWlzYy1iYXNlLmM6MTI1OCBpcyBhIGZpeGVkLXNp
emUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBi
ZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL21pY3JvY2hpcC9taWNyb2No
aXAtaXNjLWJhc2UuYzoxMjU4Ci0gcmVmdXRlIHdpdGg6IGEgdXNlciByZWFjaGFibGUgaW5wdXQg
cGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4K
CiMjIyBCNi4gbWVkaWEvcGxhdGZvcm0vcWNvbS9pcmlzL2lyaXNfaGZpX2dlbjJfY29tbWFuZC5j
ICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1z
YWZlKV0KLSBkcml2ZXI6IGlyaXMgaGZpIGdlbjIgY29tbWFuZAotIHJlYWNoYWJpbGl0eTogcmVh
Y2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQot
IENMQUlNOiB0aGUgZmluZGluZyBhdCBtZWRpYS9wbGF0Zm9ybS9xY29tL2lyaXMvaXJpc19oZmlf
Z2VuMl9jb21tYW5kLmM6OTkxIGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2Vz
cyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KLSBldmlkZW5jZTog
bWVkaWEvcGxhdGZvcm0vcWNvbS9pcmlzL2lyaXNfaGZpX2dlbjJfY29tbWFuZC5jOjk5MQotIHJl
ZnV0ZSB3aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBh
Y2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCgojIyMgQjcuIG1lZGlhL3BsYXRmb3Jt
L3RpL2FtNDM3eC9hbTQzN3gtdnBmZS5jICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9y
IGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IGFtNDM3eC12cGZlCi0gcmVh
Y2hhYmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZpcm1l
ZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IG1lZGlhL3BsYXRmb3JtL3RpL2Ft
NDM3eC9hbTQzN3gtdnBmZS5jOjE1OCBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBh
Y2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVu
Y2U6IG1lZGlhL3BsYXRmb3JtL3RpL2FtNDM3eC9hbTQzN3gtdnBmZS5jOjE1OAotIHJlZnV0ZSB3
aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mg
b3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCgojIyMgQjguIG1lZGlhL3BsYXRmb3JtL3RpL3Zw
ZS92aXAuYyAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVS
SUZJRUQtc2FmZSldCi0gZHJpdmVyOiB2aXAKLSByZWFjaGFiaWxpdHk6IHJlYWNoYWJpbGl0eSBu
b3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9uLWRldmljZSkKLSBDTEFJTTogdGhl
IGZpbmRpbmcgYXQgbWVkaWEvcGxhdGZvcm0vdGkvdnBlL3ZpcC5jOjMwOSBpcyBhIGZpeGVkLXNp
emUgLyBib3VuZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBi
ZSBjZXJ0aWZpZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL3RpL3ZwZS92aXAuYzozMDkK
LSByZWZ1dGUgd2l0aDogYSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRo
aXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgoKIyMjIEI5LiB2aWRlby9mYmRl
di9icm9hZHNoZWV0ZmIuYyAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1h
cnJheSAoVkVSSUZJRUQtc2FmZSldCi0gZHJpdmVyOiBicm9hZHNoZWV0ZmIKLSByZWFjaGFiaWxp
dHk6IHJlYWNoYWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9uLWRl
dmljZSkKLSBDTEFJTTogdGhlIGZpbmRpbmcgYXQgdmlkZW8vZmJkZXYvYnJvYWRzaGVldGZiLmM6
OTA2IGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0
eSBwcm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KLSBldmlkZW5jZTogdmlkZW8vZmJkZXYvYnJv
YWRzaGVldGZiLmM6OTA2Ci0gcmVmdXRlIHdpdGg6IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0
aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KCiMj
IyBCMTAuIHZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5jICBbQ0xBU1MtQyAobmVlZHMgZGlz
YXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IGc0NTAg
cGxsCi0gcmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0IGJl
IGNvbmZpcm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IHZpZGVvL2ZiZGV2
L21hdHJveC9nNDUwX3BsbC5jOjI2MiBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tlZCBh
Y2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZpZGVu
Y2U6IHZpZGVvL2ZiZGV2L21hdHJveC9nNDUwX3BsbC5jOjI2MgotIHJlZnV0ZSB3aXRoOiBhIHVz
ZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBp
dHMgZGVjbGFyZWQgYm91bmQuCgojIyMgQjExLiB2aWRlby9mYmRldi9tYXRyb3gvbWF0cm94ZmJf
bWlzYy5jICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJ
RklFRC1zYWZlKV0KLSBkcml2ZXI6IG1hdHJveGZiIG1pc2MKLSByZWFjaGFiaWxpdHk6IHJlYWNo
YWJpbGl0eSBub3QgZXN0YWJsaXNoZWQgKG11c3QgYmUgY29uZmlybWVkIG9uLWRldmljZSkKLSBD
TEFJTTogdGhlIGZpbmRpbmcgYXQgdmlkZW8vZmJkZXYvbWF0cm94L21hdHJveGZiX21pc2MuYzo1
MTAgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5
IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiB2aWRlby9mYmRldi9tYXRy
b3gvbWF0cm94ZmJfbWlzYy5jOjUxMAotIHJlZnV0ZSB3aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlu
cHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91
bmQuCgojIyMgQjEyLiB2aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jICBbQ0xB
U1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0K
LSBkcml2ZXI6IG1iODYyeHhmYiBhY2NlbAotIHJlYWNoYWJpbGl0eTogcmVhY2hhYmlsaXR5IG5v
dCBlc3RhYmxpc2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQotIENMQUlNOiB0aGUg
ZmluZGluZyBhdCB2aWRlby9mYmRldi9tYjg2Mnh4L21iODYyeHhmYl9hY2NlbC5jOjQzIGlzIGEg
Zml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBwcm9wZXJ0
eSBtdXN0IGJlIGNlcnRpZmllZC4KLSBldmlkZW5jZTogdmlkZW8vZmJkZXYvbWI4NjJ4eC9tYjg2
Mnh4ZmJfYWNjZWwuYzo0MwotIHJlZnV0ZSB3aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBh
dGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCgoj
IyMgQjEzLiB2aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtZHNpLWNtLmMg
IFtDTEFTUy1DIChuZWVkcyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNh
ZmUpXQotIGRyaXZlcjogcGFuZWwtZHNpLWNtCi0gcmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkg
bm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRo
ZSBmaW5kaW5nIGF0IHZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC1kc2kt
Y20uYzoxOTkgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNl
Y3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiB2aWRlby9mYmRl
di9vbWFwMi9vbWFwZmIvZGlzcGxheXMvcGFuZWwtZHNpLWNtLmM6MTk5Ci0gcmVmdXRlIHdpdGg6
IGEgdXNlciByZWFjaGFibGUgaW5wdXQgcGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRz
aWRlIGl0cyBkZWNsYXJlZCBib3VuZC4KCiMjIyBCMTQuIHZpZGVvL2ZiZGV2L29tYXAyL29tYXBm
Yi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5jICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNz
ZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJRklFRC1zYWZlKV0KLSBkcml2ZXI6IHBhbmVsLXRw
by10ZDAyOHR0ZWMxCi0gcmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVk
IChtdXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IHZp
ZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9wYW5lbC10cG8tdGQwMjh0dGVjMS5jOjcx
IGlzIGEgZml4ZWQtc2l6ZSAvIGJvdW5kcy1jaGVja2VkIGFjY2VzcyB3aG9zZSBzZWN1cml0eSBw
cm9wZXJ0eSBtdXN0IGJlIGNlcnRpZmllZC4KLSBldmlkZW5jZTogdmlkZW8vZmJkZXYvb21hcDIv
b21hcGZiL2Rpc3BsYXlzL3BhbmVsLXRwby10ZDAyOHR0ZWMxLmM6NzEKLSByZWZ1dGUgd2l0aDog
YSB1c2VyIHJlYWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNp
ZGUgaXRzIGRlY2xhcmVkIGJvdW5kLgoKIyMjIEIxNS4gdmlkZW8vZmJkZXYvcHhhZmIuYyAgW0NM
QVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSld
Ci0gZHJpdmVyOiBweGFmYgotIHJlYWNoYWJpbGl0eTogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxp
c2hlZCAobXVzdCBiZSBjb25maXJtZWQgb24tZGV2aWNlKQotIENMQUlNOiB0aGUgZmluZGluZyBh
dCB2aWRlby9mYmRldi9weGFmYi5jOjE5MDQgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNr
ZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2
aWRlbmNlOiB2aWRlby9mYmRldi9weGFmYi5jOjE5MDQKLSByZWZ1dGUgd2l0aDogYSB1c2VyIHJl
YWNoYWJsZSBpbnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRl
Y2xhcmVkIGJvdW5kLgoKIyMjIEIxNi4gbWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvZG1hMmQvZG1h
MmQuaCAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2VtYmx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJ
RUQtc2FmZSldCi0gZHJpdmVyOiBkbWEyZC5oCi0gcmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkg
bm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRo
ZSBmaW5kaW5nIGF0IG1lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL2RtYTJkL2RtYTJkLmg6NzggaXMg
YSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdob3NlIHNlY3VyaXR5IHByb3Bl
cnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiBtZWRpYS9wbGF0Zm9ybS9zdC9zdG0z
Mi9kbWEyZC9kbWEyZC5oOjc4Ci0gcmVmdXRlIHdpdGg6IGEgdXNlciByZWFjaGFibGUgaW5wdXQg
cGF0aCB0aGF0IGRyaXZlcyB0aGlzIGFjY2VzcyBvdXRzaWRlIGl0cyBkZWNsYXJlZCBib3VuZC4K
CiMjIyBCMTcuIG1lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3JvY2tjaGlwX2F2MV9lbnRyb3B5
bW9kZS5oICBbQ0xBU1MtQyAobmVlZHMgZGlzYXNzZW1ibHkpIG9yIGZpeGVkLWFycmF5IChWRVJJ
RklFRC1zYWZlKV0KLSBkcml2ZXI6IHJvY2tjaGlwIGF2MSBlbnRyb3B5bW9kZS5oCi0gcmVhY2hh
YmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkIChtdXN0IGJlIGNvbmZpcm1lZCBv
bi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IG1lZGlhL3BsYXRmb3JtL3ZlcmlzaWxp
Y29uL3JvY2tjaGlwX2F2MV9lbnRyb3B5bW9kZS5oOjIwMyBpcyBhIGZpeGVkLXNpemUgLyBib3Vu
ZHMtY2hlY2tlZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZp
ZWQuCi0gZXZpZGVuY2U6IG1lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL3JvY2tjaGlwX2F2MV9l
bnRyb3B5bW9kZS5oOjIwMwotIHJlZnV0ZSB3aXRoOiBhIHVzZXIgcmVhY2hhYmxlIGlucHV0IHBh
dGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBpdHMgZGVjbGFyZWQgYm91bmQuCgoj
IyMgQjE4LiB2aWRlby9mYmRldi9jb250cm9sZmIuaCAgW0NMQVNTLUMgKG5lZWRzIGRpc2Fzc2Vt
Ymx5KSBvciBmaXhlZC1hcnJheSAoVkVSSUZJRUQtc2FmZSldCi0gZHJpdmVyOiBjb250cm9sZmIu
aAotIHJlYWNoYWJpbGl0eTogcmVhY2hhYmlsaXR5IG5vdCBlc3RhYmxpc2hlZCAobXVzdCBiZSBj
b25maXJtZWQgb24tZGV2aWNlKQotIENMQUlNOiB0aGUgZmluZGluZyBhdCB2aWRlby9mYmRldi9j
b250cm9sZmIuaDoxMDAgaXMgYSBmaXhlZC1zaXplIC8gYm91bmRzLWNoZWNrZWQgYWNjZXNzIHdo
b3NlIHNlY3VyaXR5IHByb3BlcnR5IG11c3QgYmUgY2VydGlmaWVkLgotIGV2aWRlbmNlOiB2aWRl
by9mYmRldi9jb250cm9sZmIuaDoxMDAKLSByZWZ1dGUgd2l0aDogYSB1c2VyIHJlYWNoYWJsZSBp
bnB1dCBwYXRoIHRoYXQgZHJpdmVzIHRoaXMgYWNjZXNzIG91dHNpZGUgaXRzIGRlY2xhcmVkIGJv
dW5kLgoKIyMjIEIxOS4gdmlkZW8vZmJkZXYvcml2YS9yaXZhX2h3LmggIFtDTEFTUy1DIChuZWVk
cyBkaXNhc3NlbWJseSkgb3IgZml4ZWQtYXJyYXkgKFZFUklGSUVELXNhZmUpXQotIGRyaXZlcjog
cml2YSBody5oCi0gcmVhY2hhYmlsaXR5OiByZWFjaGFiaWxpdHkgbm90IGVzdGFibGlzaGVkICht
dXN0IGJlIGNvbmZpcm1lZCBvbi1kZXZpY2UpCi0gQ0xBSU06IHRoZSBmaW5kaW5nIGF0IHZpZGVv
L2ZiZGV2L3JpdmEvcml2YV9ody5oOjM2NiBpcyBhIGZpeGVkLXNpemUgLyBib3VuZHMtY2hlY2tl
ZCBhY2Nlc3Mgd2hvc2Ugc2VjdXJpdHkgcHJvcGVydHkgbXVzdCBiZSBjZXJ0aWZpZWQuCi0gZXZp
ZGVuY2U6IHZpZGVvL2ZiZGV2L3JpdmEvcml2YV9ody5oOjM2NgotIHJlZnV0ZSB3aXRoOiBhIHVz
ZXIgcmVhY2hhYmxlIGlucHV0IHBhdGggdGhhdCBkcml2ZXMgdGhpcyBhY2Nlc3Mgb3V0c2lkZSBp
dHMgZGVjbGFyZWQgYm91bmQuCgoKIyMgQy4gUmVhZAoKVGhlIG9ubHkgdGhpbmcgYSB2dWxuZXJh
YmlsaXR5IHByb2dyYW0gYWNjZXB0cyBpcyBhIFJFRlVURUQgY2xhaW0gd2l0aCBhCndvcmtpbmcg
UG9DLiBUaGlzIGluc3RydW1lbnQgaXMgdGhlIGZvcmNpbmcgZnVuY3Rpb24gQkVGT1JFIGEgUG9D
OiBldmVyeQpjbGFpbSBpcyBwaHJhc2VkIHNvIHRoZSB2ZW5kb3IgY2Fubm90IHdhdmUgaXQgYXdh
eSB3aXRoICd3ZSByZXZpZXdlZCBpdCcuCkEgQ09ORklSTUVEIGNsYWltIGlzIGEgY2VydGlmaWVk
IFNBRkUgcmVzaWR1YWwsIG5vdCBhIGJ1Zy4gVGhhdCBpcyB0aGUKaG9uZXN0IGVuZC1zdGF0ZSBv
ZiB0aGlzIGF1ZGl0OiBVTktOT1dOIGJlY2FtZSBuYXZpZ2FibGUsIGFuZCB0aGUgc2NhcnkKcGF0
aG9sb2d5IHJlc29sdmVkIHRvIGVpdGhlciBhIG5hbWVkIFNBRkUgcmVzaWR1YWwgb3IgYW4gZXhw
bGljaXQgQ0xBU1MtQwpxdWV1ZSDigJQgbmV2ZXIgdG8gYSBtYW51ZmFjdHVyZWQgZXhwbG9pdC4K
--000000000000e8d8e1065aab7728--
