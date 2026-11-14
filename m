Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794664802;
	b=OkF7wqUXcbHIo8Hm8xSyPUrjzn9F7J1nCl+zroQTnD153HsiDcFCqqiDwOpE6QlHvS61
	 vzaMeHNN+hJXTrKskNwGzR1cJM1mTb1P5sT/1k35tFbuWce9ytCJpA2tT3vYSg6hYfRyt
	 IIzEhgmoDtU7FqFdKE6o2XfvhMownpUZPwf67z5x8dt3moaFY3BeJB5r2OgEHs0nFbf1w
	 nUsIbkkm/+6Ttu6jrUcQMEEZDjZVC0GPo5/XCF2FnnkJTifXxEz1elzv69bB5wDH7tNtQ
	 NBVQe3LZAtfgV9ABudIOplcY97EsKqxOOyFvPxZnZUwDCgjQTzYAntmuuEnkqMAZZzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794664802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 Feedback-ID:X-Infomaniak-Routing;
	bh=EDBgPC6ITb9J3xFq1ovAYMVyfTW39nSEsNOx9gLCCDg=;
	b=XpQdCWDfgptsEedguN/wY4Tq2nRmGi+C47oTZMvjHEz4Kd1A0/4nglw1DpZjA8bDUlk8
	 fphL5JKep7arHpivlDLJAAk0NXm75juz+hikoEaXHw7irW9xsQwgWB2XvM9rwcW491X03
	 cubpQhesYokl9zhjDh7WzQ1t+781DnmUgg380NlhlwEn+fO/yxcanPeFobGKi1yIYpilT
	 H0qUaWRaG/TlrHOgCD4ZfhHNKaKxQgf+ASw0jVHD214/zoQJUAjHhJ7e/WA9SNppfg5dd
	 +9HQMqR2mehDD4vT0rxhzMKBKpWQTsbzvMYBStXkyzVqMicqB1vGgFx2b8tK16hhNqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ik.me;
	spf=pass smtp.mailfrom=ik.me;
	dkim=pass header.d=ik.me header.i=@ik.me header.a=rsa-sha256 header.s=20200325 header.b="fH5rKRN/";
	arc=none smtp.remote-ip=83.166.143.172
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27AB606A329
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27AB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256 header.s=20200325 header.b=fH5rKRN/
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jRbNS2jcLzSdc;
	Sat, 14 Nov 2026 14:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1794664792; bh=EDBgPC6ITb9J3xFq1ovAYMVyfTW39nSEsNOx9gLCCDg=;
	h=From:To:Cc:Subject:Date:From;
	b=fH5rKRN/77oBAsGNmm8YIFASYv4WCFB2Ik9PzuMiJ42TV+UCKcCcqlESQj8mkUd79
	 f0Z0vtSzklOH6OD7uEtGBgE6QP+z3rwxQKZxxOBIgYeMwoTSzHwfjEk6r8+6dblaIU
	 di9xpnCod+YuFBdPCfGEPNfxbDTWlnDFbCcJJMro=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jRbNR2pNCzSZ3;
	Sat, 14 Nov 2026 14:59:51 +0100 (CET)
From: Selim Awn <selimawn@ik.me>
To: yunfei.dong@mediatek.com, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org
Subject: MT8189 SCP firmware: single-core HEVC INIT clears 256 KiB past
 h265_dec_srv_param and crashes the SCP
Date: Sat, 14 Nov 2026 14:59:51 +0100
Message-ID: <179466479105.70915.3582435008101380821@ik.me>
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
Feedback-ID: :b7a7c7c8b482037:ham:b366ec3b20c1372
X-Infomaniak-Routing: alpha

Hi,

On MT8189 (ASUS Chromebook "Tarkin"), opening a stateless HEVC decoder
crashes the SCP every time. I believe this is a bug in the SCP
firmware.

Setup:
- Kernel: chromeos-6.6 based, 6.6.147, mtk-vcodec-dec stateless,
mtk_vdec_single_core_pdata (MTK_VDEC_PURE_SINGLE_CORE)
- Firmware: linux-firmware mediatek/mt8189/scp.img, "9a0dfa3 Aug 4
2025", sha256
7b1d56bfe34db620be411e72a56b5bdc981e88fce5664b73a5d270ae9d821f23
- The ChromeOS SCP image "e3c0782 Jan 30 2026" has the same code and
constants, so it should be affected too (checked by disassembly only)

Symptom: the AP_IPIMSG_DEC_INIT (0xA000) for 'S265' on IPI 14 is never
acked. "SCP watchdog timeout! 0x0" fires within milliseconds, then
"scp ipi 14 ack time out" appears and remoteproc reloads scp.img.

Cause, from the firmware's symbols/DWARF (vdec_h265_sig_srv.c,
vdec_com_h265.c, vdec_h265_psr.c):
- h265_dec_srv_param is at 0x73d6b8, size 0x221398, ending at
0x95ea50.
- INIT places the instance at offset 0xfc30 (0x74d2e8).
h265_init_instance_ctx() puts three areas after it, back to back: the
instance (0x2558), buf1 at 0x74f840 (0x20f210, ending exactly at
0x95ea50) and buf2 at 0x95ea80.
- vdec_h265_init_rom() then does memset(buf2, 0, 0x3fff0), up to
0x99ea70. This clears hw_param, hal_param, default_frame_context_bin,
dcq/acq_lookup, h264_dec_param, h264_comhal_bsops, venc_vsi,
venc_drv_inst, venc_h264_func, the venc RC/reference tables, and then
runs past __dram_end (0x98b000).
- In short, the object is 0x40000 bytes too small for its own layout.

How I verified it (read-only on the firmware side):
1. Set remoteproc recovery to disabled.
2. Sent one HEVC INIT.
3. After the crash, read the SCP DRAM (phys 0x50000000 =3D SCP 0x700000)
through /dev/mem.
4. Set recovery back to enabled.
Result: the buf2 pointer was 0x95ea80, and default_frame_context_bin,
dcq_lookup, h264_comhal_bsops and venc_h264_func were all zero (they
were non-zero before).

To reproduce: on an unpatched kernel, open an HEVC_SLICE context on
the decoder node, e.g. ffmpeg -hwaccel vaapi with libva-v4l2_request
on any HEVC clip.

Kernel side: vdec_hevc_req_multi_if only implements LAT + core, and
its decode() rejects MTK_VDEC_PURE_SINGLE_CORE, in chromeos-6.6 and in
mainline. The format is still offered because the firmware sets
MTK_VDEC_FORMAT_HEVC_FRAME (dec_capability 0xc1520). Locally I now
skip HEVC_SLICE on pure single core and return -EOPNOTSUPP in
vdec_hevc_slice_init() before any IPI is sent. I can post that if it
is useful.

Questions:
1. Can you confirm the overrun and fix the firmware (grow
h265_dec_srv_param or move buf2)?
2. Is single-core HEVC (vdec_h265_sig_srv) meant to be supported on
MT8189? If so, is a kernel single-core backend planned, or what
VSI/IPI flow should it follow? If not, should the firmware stop
setting the HEVC capability bit?
3. Can you confirm that the MT8189 SCP firmware has no AV1 decoder?
vdec_msg_handler only dispatches VP9F/S265/S264, and the AV1
capability bit (0x800) is not set.

Thanks,
Selim
