Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489176;
	b=M5tWmCveCzdMcaVWqUfa+xOBE8DLn0shX6pmTfMJH34p94exeVgU9xPObeBrD7UvGXkD
	 Ud0b9IUMw94aAb6KLIgMOGQQEg9LpQratnc9LOq/Ua5l5niuWxMbOrjlYp/eaexCp/XfF
	 CF/hE/36l60P5vzKMG98vnwZRoR57Mz0ROaQzPKOoh4JIb6+AgLzt9LsVmJfNyMjzLtZ8
	 fO96Q+n3Wf/33HeEh0i7wjALgv/phWZ0G/wqqO2SfnOPO2EwF4LJWfuiQPLs8YHjPtjh5
	 tUI40EZiIdEwSWXgJ1THLKQKLXJSvckxOKHwJLTuQd1h5e2ZGKRk+wXf8MwG+hWMZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489176;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=gqtZ21UqaYYR3fOd0ypLRHMzJ6MvuVcy0iqdOmPHC64=;
	b=gihLOkuewF3AhY3XQQsfBRrimTAX60iWK4neSXdzBKB0wtdSO5StTfkJFQ89L0yNEWnx
	 OIuygYUnpzFYNKxq2jJXwm6f5fc/S4W/G2LKHm4U8KMT9u5Zphtv1fCqMRP0zyXtbxZn1
	 8lePJwX/QBG0co1xuijFeY176cfjiop8HxYY+8/Taag8Xx17cJLR89VBJP9IiJoPpjeYB
	 +kb8zYzdXfFgKeTzT6N2GPDQEX+OO6Zswpduhx/ieRxpDEUO+tVlBa8kR+f8G7B/xu0w+
	 IDuvPWogN7imvF+Kl57NgBNRUFaCRRx+jGZ9DGEYChSBAFjCopZ2f/LhF0VVWzPc1hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=VRFv4LRC;
	arc=none smtp.remote-ip=57.103.79.73
Received: from outbound.st.icloud.com (st-2005k-snip4-11.eps.apple.com [57.103.79.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569D460A4AFF
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 09:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569D460A4AFF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=VRFv4LRC
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 5EF621800696;
	Tue, 20 Oct 2026 09:39:33 +0000 (UTC)
X-ICL-RepId: 01a158ae-314b-7c4a-b6e4-512004b83bbb
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0MUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489175; x=1824025175; bh=gqtZ21UqaYYR3fOd0ypLRHMzJ6MvuVcy0iqdOmPHC64=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=VRFv4LRCe7C/AHVvW10MJxd7x7QJoatZWgdxVbRMQ2+PtZ4l7/hgPA4NY43L74LXMbk7u94JH7KBSWKSEt4Sd63EMy8+CIemmznTqGs3RQ3s3T+7XKuZusAQrY1atvmgYNgngYmz61J7xP6MtJtpKGQALtHIUN/n8BbAhGf2+PzWVCJPTHGbmpcxsn29IVZVYuTIOimmSoBaTIyFk/2JM3cVgeoz0oHmPx6x+Qjdcrd+6QLfZUgGDVezPwb3UXSCJzthImcIw7oX4bGbcH3a2OLAaCKFbQWgl1+mArWH4GHxsMbjQLRVlgi/2Tw3BbVgA9Crx1sZkO6SBvtkKQMaIA==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id DBABA1800219;
	Tue, 20 Oct 2026 09:39:30 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:54 +0200
Subject: [PATCH v3 13/17] arm64: dts: apple: t8122: add avd nodes
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-avd-v3-13-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: obwm5FebKXm6xf0YZntT9lwn6be5tInT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX2AH7g+Kb0v5p
 8aMgwcmOu0GvMMGFSAfwjVMRge6Gc7K/8S4v0U0yu0dshiqmRbbwFmQ4mnACDFPgchxgQxzy1jp
 0zynIVnHXr95Q6EYzqaRCD/3LYnsElfBECAln14tRttiZWl636EkHes1uPedC0L5nAY7zDLc6dI
 7CFrAOnPVFJw7cXAjGhGWeqGfHpRwE8vQipUsjcYHw0h2FFQ++XU8moyCvLuPisNVmWUS14AqC1
 bCE8qftM/Azj+ms7tQ/U37/i8bB16UZeD6Bm8bRsH11yoz5owqhqfYImKlr3mVCKqFZMj8gTuK0
 7Wh12VOIBb613HWmkuOLcIctwvX692PvBa4MRLsqUIihIiKQ7TcytwDhkdgOi4=
X-Authority-Info-Out: v=2.4 cv=Ea7FgfmC c=1 sm=1 tr=0 ts=6ad736d6
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=rETEL0j7aIRCupOTUFwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: obwm5FebKXm6xf0YZntT9lwn6be5tInT
X-JNJ: AAAAAAABdrFI/5MwmdEJubWGtCHVa99Yi5pFFd6vUohfx93fIo8jSQrs13wQCfeEGRV0b/YWge13PDKk6bQrCE21LZ86B0Yj+85RDC85XaWzKjL4agNzXlOqLmY6O4N197dnqYkaAAeM18NyyMpRMCrY/e34qvd519XWMnmVwj74H2dMfgm7BefHCNbMmzYwB8p2B7PsLAj1GwyAuBDbzYVGEO39uzf/ZuaNSCCGfF1KXLBl/UnGeZVskGmxwztg8amikhgYj+jX6sxkFFH1heiAtclGFuXqwuitcu+nXPu3a8wG5JeeBOjqr18TFkszdVxXgWl2xq2vZ5/hwMe+rJRUk3BKTC3o4gOhrGRL6lJ6P2SoLZHBkuzbDBrGko6dPIqmMWd44ndd0bfJscCib5fpJSiyQYJYKdPQLTDzRdiQudd86LXMWFumkfgsPV01Vi2aJwjlrJGYhKEMJq7yX2n0pwn1Ooj88L6SBvGVbKQwRZ9MoY3cwRAKQ04HkuYuXoidtIuxvIydllYGQauaoqjbpN0roaIfdzZtzeOgtFs1u/mwpk/kfbAvYFMwV+lbtZEh5Z9Zto7sBibTWZpvBelD7YzMep+4Jjiv1qrRcOFihElXUgHTujYtz0seH3nu/Eyd41wUzY78bzJGscgw+JnYL/0z3cxMW/blFFYP848naSTY++SaEow6DpepUzq+h1fQwO1rkzegRRPHIiYIhYwaRPXI1OTJGm2AcEZAJtRSvOXQZnjBLy7Pe0xGx0cccKVfXLevXqu1UZc6q8LH4L8xIf9NhJR6cf1a2Z3TZ+ORJv7jFPWrY2HaPBhGla0DXBBzYXZNazUrmMI7mbhXXgheuTYO7w8Lp5OfGhAZrTezP9ydP7/M5tX7CF8HwnPB1qpRbxmNEwCchVfwRrUmQVykc9gnmxuFCUxd0npJ

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 1ee61c5b3409..25e47755e095 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -186,6 +186,38 @@ soc {
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
 
+		avd_dart: iommu@289010000 {
+			compatible = "apple,t8122-dart", "apple,t8110-dart";
+			reg = <0x2 0x89010000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 686 IRQ_TYPE_LEVEL_HIGH>;
+			#iommu-cells = <1>;
+			power-domains = <&ps_avd_sys>;
+		};
+
+		video-codec@289070000 {
+			compatible = "apple,t8122-avd";
+			reg = <0x2 0x89070000 0x0 0x4000>,
+			      <0x2 0x89080000 0x0 0x10000>,
+			      <0x2 0x89090000 0x0 0x14000>,
+			      <0x2 0x890a4000 0x0 0x4000>,
+			      <0x2 0x89100000 0x0 0x10000>;
+			reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <AIC_IRQ 685 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+					  "flag0", "flag1", "piodma";
+			iommus = <&avd_dart 0>, <&avd_dart 1>;
+			power-domains = <&ps_avd_sys>;
+			resets = <&ps_avd_sys>;
+		};
+
 		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
 			reg = <0x2 0xa1010000 0x0 0x4000>;

-- 
2.55.0

