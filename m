Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280170;
	b=wlC1SlC5QOkTt2qLU+5iFf0NSofRRCsms7jFPgqOeJPA/MEx/4d+6PLRUyDLte1pAGAy
	 JbphmxuTi2zgwkk4ekz/LA2dVLdzrWA7JH/AB5tGmr9E3RG2+YZYVkhO2uGkWd1v6z+Ld
	 OrYrDTobrYHV/0XXh7o82v1m0EAwJXtyghyVMYCGJ/ExHjVSzGGvyZr2BqfQRZj2vDEy2
	 S0DWw2Xo1VADomQ7vTikj5qszCx5zJ184buBVuOEeW0J0Oq8pYCpSAldK5Oo96ZpYPPCk
	 ou0T9SPydF02YbnA74POBuud/3hWc8LiwC/SBKEcafvQgr+RDvbmbsmouvCP52gDtVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280170;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=xYz9pA1mSMoNnWygMUOBu3XO1KnQlEYwkYTGx2Jq9oQ=;
	b=nOdZScrrICXramFjGckD9p8SEzymV7UWaaexbuFikJuFDO3x1e95QqeHVziqxHtVRtIi
	 RrH/e4GPXE7LNi6fYXdnQW/iLht6T3fwRlkzWVSuz3rnf4xsqGak07xSdJ97hprvl95sO
	 bkIw70VK5sUaj6b1tFDVyKiZwpxCKcExZwNo9LXjudeBX4UY1c/pPyqDCLqcO9D5qi3ks
	 V4EbIzuMVOUCMeqHiCOksVBaGDD4qsA+vpLR+Xa+zmH5cXesNscwyvH4knM0R6T7sg9kl
	 LW1CRzrRuxVduWARPtbVaiQ3FnUZu0/Pa7cGHsYNQ4CxKBrJZ0awsRys8T4B48kOmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E2606A320;
	Sat, 21 Nov 2026 16:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 014E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUoNY-000000006Hk-2eaa;
	Sat, 21 Nov 2026 16:55:56 +0000
Date: Sat, 21 Nov 2026 16:55:40 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v6 0/5] media: rockchip: rkvdec: add support for the VDPU346
 variant
Message-ID: <cover.1795279680.git.daniel@makrotopia.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
[1]; in the v2 cover letter he offered to pass the series on. The
previous posting [2] carried no version in its subject and counts as
v4.

Patches 1, 2 and 4 are Christian's, with two fixups folded in that v4
carried as separate patches. Patches 3 and 5 are new since v3 and come
out of a comparison of the driver with the vendor kernel driver
(rockchip-linux/kernel develop-6.6, drivers/video/rockchip/mpp) and
the Rockchip MPP library, followed by conformance runs on hardware.

Fluster on a NanoPi R5C (RK3568B2), GStreamer 1.28.7 v4l2sl decoders:

  JCT-VC-HEVC_V1   142/147
  JVT-AVC_V1       129/135
  JVT-FR-EXT        65/69

HEVC failures: PICSIZE_A/B/C/D_Bossen_1 are coded at up to 8440 luma
samples in one dimension, beyond the 4096x2304 limit of the decoder.
TSUNEQBD_A_MAIN10_Technicolor_2 has unequal luma and chroma bit depth,
which the driver rejects for every variant.

H.264 failures: CVFC1_Sony_C, FM1_BT_B, FM1_FT_E, SP1_BT_A, sp2_bt_b
and FM2_SVA_C fail in JVT-AVC_V1; the Hantro G1 of the same board
fails the same six with the same GStreamer. In JVT-FR-EXT
Hi422FREXT17_SONY_A, Hi422FREXT19_SONY_A, HPCAMOLQ_BRCM_B and
HPCVMOLQ_BRCM_B fail; the two BRCM vectors fail on the Hantro G1 as
well, the two Hi422 intra profile vectors are not understood yet.

SAODBLK_A/B_MainConcept_4 and FREH10-1/2 are counted as passes: they
decode correctly and exceed the default 60 s fluster timeout only
because the checksum is computed from an uncached mapping of the
capture buffers.

Patch 3 is what makes the score deterministic. With the read caches
left in their reset state, RAP_B_Bossen_2, WPP_D_ericsson_MAIN_2,
WPP_D_ericsson_MAIN10_2, WPP_E_ericsson_MAIN_2 (HEVC) and
CAPM3_Sony_D, MR8_BT_B, MR9_BT_B, NRF_MW_E (H.264) produce wrong
output in three runs out of three; with the patch they pass in three
out of three. This is likely the source of the artefacts reported
against v3. The function is shared with the VDPU381, where the cache
block is mapped by the binding already. The series has been run on
the RK3588 as well as on the RK3568.

Decode rates with the series: HEVC Main 2160p 92 fps, Main10 2160p
77 fps, Main 1080p 380 fps, H.264 High 1080p 197 fps.

Patch 5 is kept apart from the node it modifies because the existing
Tested-by tags were given at the v3 clock rates, and so that it can be
dropped on its own.

On the row and column buffer sizes raised in the v3 review [3]: the
MPP library uses one vdpu34x HAL with one set of size formulas for the
RK356x and the RK3588, so the variant keeps vdpu381_rcb_sizes.

Known limits, none of them introduced here:

- FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
  and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
  on this decoder as on the VDPU381 ("Long and short term RPS not
  set"). The handling of these controls is also the subject of [6].
- A decode error on such a stream ends in the IOMMU page faults and
  the oops reported against v3 [4]. The cause is in the error path
  shared by all variants: the interrupt handler restores the IOMMU
  while the watchdog is still armed, and the watchdog starts the next
  job while the IOMMU is detached. "media: rkvdec: Handle interrupts
  without a current context" [5] covers the oops; the remainder will
  be addressed separately.
- The Sashiko review of v4 points out that rkvdec_probe() takes the
  SRAM pool without a device link to its provider. This predates the
  series, affects all variants with an sram property and will be sent
  as a separate fix.

Patches 3 and 5 were written with the help of an LLM coding assistant,
which also performed the comparison with the vendor sources. It was
asked to review the v3 series against the vendor driver and to
complete it, and for v5 to go through the v4 feedback, fold the fixups
and revise the commit messages. The conformance and A/B runs above
were done on the board with builds of v4 on Linux 6.18; v5 and v6
differ from v4 in the order of two writes to the device tree source,
in one node name and in tags, the driver code is unchanged.

Changes since v5:
- Drop the Tested-by from "media: dt-bindings: rockchip: Add RK3568
  Video Decoder bindings"

Changes since v4:
- Fold "media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions"
  into "media: rkvdec: Add support for the VDPU346 variant", so that
  no commit registers 65 element controls
- Fold "arm64: dts: rockchip: rk356x: Order vdec regs by address" into
  "arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X"
- Name the SRAM pool node codec-sram as on the RK3588
- Read caches: shorten the commit message and state that the cache
  block is mapped for the VDPU383 as well
- 400 MHz: state that the rate applies to all streams
- Cc the reviewers and testers of v3

Changes since v3:
- Add "media: rkvdec: vdpu381: Program the read caches"
- Add "arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz"
- Register the HEVC EXT SPS RPS controls with 64 and 32 elements
- List the vdec register blocks as link, function, cache
- Add fluster scores and failure analysis
- Add Tested-by from Diederik de Haas

Changes since v2:
- Use correct .max_width/.max_height from TRM (Diederik de Haas)
- Add Tested-by from Dang Huynh

Changes since v1:
- Drop DO-NOT-MERGE patch as changes included in Detlev's v7 series
- Adapt to variant/capability changes in Detlev's v7 series
- Add bindings ack from Rob
- Add rkvdec ack from Nicolas
- Rebase against Linux 6.19-rc2

v5: https://lore.kernel.org/r/cover.1795191822.git.daniel@makrotopia.org
v4: https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org
v3: https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
v2: https://lore.kernel.org/r/20251226113140.573759-1-christianshewitt@gmail.com

[1] https://lore.kernel.org/r/20260110053727.2295260-1-christianshewitt@gmail.com
[2] https://lore.kernel.org/r/cover.1794654074.git.daniel@makrotopia.org
[3] https://lore.kernel.org/r/DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com
[4] https://lore.kernel.org/r/DFRU6ODDM71P.3NQGLRK8IVDUY@cknow-tech.com
[5] https://lore.kernel.org/r/20261026124808.642373-1-a.kazinsky@ideco.ru
[6] https://lore.kernel.org/r/cover.1794645268.git.daniel@makrotopia.org

Christian Hewitt (3):
  media: dt-bindings: rockchip: Add RK3568 Video Decoder bindings
  media: rkvdec: Add support for the VDPU346 variant
  arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X

Daniel Golle (2):
  media: rkvdec: vdpu381: Program the read caches
  arm64: dts: rockchip: rk356x: Clock the vdec at 400 MHz

 .../bindings/media/rockchip,vdec.yaml         |   2 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi |  49 +++++++
 .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |   2 +
 .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     |   9 ++
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 121 ++++++++++++++++++
 .../media/platform/rockchip/rkvdec/rkvdec.h   |   2 +
 7 files changed, 187 insertions(+)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.56.1
