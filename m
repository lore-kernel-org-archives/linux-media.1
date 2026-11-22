Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339128;
	b=nIXqMh4KgozwgWvyQNaLrTFiOKuZ+LUFlwLwOVrVwsTJZZcdbB6FgXJAP0RbhQSx1EHa
	 lfjsLV79cLGqzaRmxrSMg23xH/r6Bi/WUlaxM4Lv6Yk0mpSaaSwU2aHhaV1hxy62FjPGs
	 WBy+c1UUPpTTSmrDdeL5sCPB0cPZw897m4ITyagON7ab9N+P2smGpPjfYKrYBXS4k92Ii
	 qzSJCvtpRIe5/Hb4k9rXP2Ip8qpQRSRlRB/xmunXz+3AwP57KWtPVKA/TBGZX+Ixsig+1
	 VdZ7Mrm3FQNCdUj18j+41rm3iIIlp7nJYuaLOHeNIiOBGAYIt95YJxPT0rXFcB7aWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339128;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:DKIM-Signature;
	bh=wszx0tuFio6hCNaSqAlXHY7T6RitMSPrZ8oFzqziRJk=;
	b=fbqxKk9v4JnAqAQmFkhyVYKHGgllCF7JqUu+7ZVLTn1866AAdsvw9fODSAssvV6vhzbK
	 4tHkrxBVc1g6oACasahOs5yvEp5mN7UUvxVuIC2bQQSccUdW7Cy6kMWl44ovQPLXcRi4Y
	 VUeUloXND/ofnfbRvPCwhz02vjT+6otoGLWJu/cuPvujlvS3mAf1dcHc5Q4Adb2toPgxy
	 fz0aEj7K5H7OnFrxGuLzxcluh3RNs3XfPq+cggOMtaQOKPxc1X4iZmJG4zHOKq+T3W8k1
	 9Pbu1RHtKZX9WYZ+8M0xq0y3GA+KH8xperg3RCcXPP7YZnF6k/P1aIZ9Lt/E1QUWKvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=iEIY9BMh;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA93606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 09:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=iEIY9BMh
Received: from [192.168.2.223] (p5b13a22d.dip0.t-ipconnect.de [91.19.162.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BF8D44C442F7ED;
	Sun, 22 Nov 2026 10:18:07 +0100 (CET)
Message-ID: <cda06da6-e7e0-4522-b1ab-ec542d4703d2@molgen.mpg.de>
Date: Sun, 22 Nov 2026 10:18:06 +0100
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
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Arden Jin <Arden.Jin@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Amlogic S4 (S805X2) video decoder firmware for linux-firmware
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1795339088; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=wszx0tuFio6hCNaSqAlXHY7T6RitMSPrZ8oFzqziRJk=; 
	b=iEIY9BMhcn35ldV3kT0zSpxT6W2aeyQUEqzqOr5R+XqiBeny0LNfw19GuKempbBNhVXcc28Ew2A2
	Xyi8VYuQWd/Nj2ATmkYyQTcLsuXKkaa7jIL/dzLzvABNmGFGheZ42BZTsUW3mm4g4VTXwYkkcThMwP
	iTsmFM08uszJIJm7jBRFPsieyt4IA4UDah4DwBcYZz2yr6DvGpWj6ipmogKf9GZynyrOyMf1RjXW86
	w9a5Gak0M6doaLYQJ1wpxLZaVarHwZcuxVGsV22hXFmuSz1hwkg5HNU4ZIS0vlUL+gUB6C/8rHqiTl
	Ks7CgSpPBGOhJJZVD8gpIPEZQAiQFdhQ==

Dear Xianwei, dear Arden,


Before buying a Chromecast with Google TV HD (boreal, Amlogic 
S805X2/S4), I would like to sort out the firmware situation.

linux-firmware has meson/vdec/*.bin for GXBB up to SM1 under 
LICENSES/LICENSE.amlogic_vdec, extracted from Amlogic’s July 2019 
release (linux-firmware commits e04cc56d and fb505a69, with Arden in 
Cc). There is nothing for S4.

In the media_modules sources Google published for boreal [1] (package 
v0.4.66, commit 1752357, built 2024-12-27), I found:

1.  firmware/S805X2/video_ucode.bin and firmware/S805X2G/video_ucode.bin 
are NEWP packages: only the headers are in plaintext, and the microcode 
is encrypted and loaded through OP-TEE (TEE_SMC_LOAD_VIDEO_FW).

2.  The headers record the CRC32 of the plaintext. Each of the 14 S4 
entries has the CRC32 and size of an entry in the generic plaintext 
package firmware/video_ucode.bin:

     - SM1 builds: h264_multi, mpeg12_multi, vc1, xvid_multi, avs_multi, 
h264_mvc
     - G12A builds: hevc, h264_multi_mmu
     - T5D builds: vp9_mmu, hevc_mmu, hevc_mmu_swap
     - SC2 av1_mmu, T7 avs2_mmu, G12B mjpeg_multi

3.  None of them is byte-identical to a file in linux-firmware, and the 
current package no longer contains the single-instance H.264 and 
MPEG-1/2 microcode that the mainline driver loads (g12a_h264.bin, 
gxl_mpeg12.bin).

The files carry no license, so I cannot submit them myself. My questions:

1.  Does Amlogic agree to distributing the S4 video decoder firmware in 
linux-firmware under LICENSE.amlogic_vdec? Concretely, the plaintext 
builds S4 uses, as meson/vdec/s4_*.bin. Would you prefer to submit them 
yourself, or to ack a submission from me?

2.  The mainline driver loads the microcode from the non-secure world, 
by pointing (HEVC_)IMEM_DMA_ADR at a coherent buffer. Does this work on 
S4, or does the DOS block only accept microcode loaded by BL32? If the 
latter, is the SMC interface documented, and does the BL32 on production 
S4 devices include the microcode?

3.  Does g12a_h264.bin work on S4, or is there an S4 build of the 
single-instance H.264 microcode? Or should the mainline driver use 
h264_multi on newer SoCs?


Kind regards,

Paul


[1]: https://nest-open-source.googlesource.com/manifest_repos/media_modules
