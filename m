Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959437;
	b=YzmoqhHcdxPyClUlHkJk9I6RsoU7SrSdKqVBSSzLhx2PCYhVNVlGSfI3v6MlRpOCQsPN
	 muAd74wqFJFeQdlJsI5/717UDVRkDqC6x0Q0wkGRGsIQTOuSHbPBFungToGFPqXT+08YR
	 FRkHo2mgJg+wm/G+x5TVY3H3meOIBvYaCE0nHOCI5EWm9eaF4jbDWqkxZe3+SHOGXqmmV
	 inUC/RGBPgPbjRHoadk4yE8MMulPKDfmqiw5u7fSKLL8E7W5UFYNqoRfAhllPLmoK6fHa
	 Dk90GB6v9z9rYVCq+bfdMu+WhVwrs5EjuxQ2q4oaHHY/uBiYBmwA+XYRhaoX1uLG4JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959437;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PfSPaVXedADf6rsPHU58q3NIdyMqzckShx4YfFgeiFg=;
	b=4HfIouOGkjCymYnhT1I3cRAq4nPQCDw6Tre+AbQLOQQ6BAB75mpzmkjGfkbf2kP4Pwdz
	 xluN3qICfk0n+fjWNSdN9IpKDcoqT84hFdrxumfm2qoF5ZV4eh0LjaoZA+XUBYvSeIg26
	 urPLP0J7SsuRQ+P2TgWWEhtuihreUz9UVY8R+dw9Eov0/1/ns9J7DyF7imiGZMYRGyzqw
	 B7uB7JGfe0bgyRHia5xPe3IooKheqJ+5rYL98ptT+H8gagNeDh696MYI1/Mwt9QSKksUj
	 y9ybSsumP0nBwOgut0rZ7g+fyOmFFcaxer99uDXzIkRTxC88uc/Y6aC+iIQDWErtEsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8KNrnbl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61937606A32A;
	Tue, 17 Nov 2026 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8KNrnbl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794959437;
	b=oTRpzlHEE9FH2F75LH/ZK4d4L+00Uq3AZnHLjwWkk76PKwjEJcxgpFNIyAKGHgTNqJd8
	 hOz3qa1KKyEC4hZDJtYXk1b5ejwwA3Q4rkfkzRXdW4Fu4co6v1+M6cn1Co7qHdrVi7yqP
	 XM6gC33PgHXKpDMK+5pusH4ayeHp0R73B4Bzc8eb3DhpksZkdC0eqYVsasj4G02PclhhQ
	 tjWn1m153fIEIv88HDu/gTc/SZP7jM1hWpnRRNePFBDP+ZJqGUyU7Rc3+TtzGNVQYfnDz
	 LfRRupbz6AKzZx+uD+8Ji6nY62MmoOYzD13/XyBywqiucpswPpGGgGx3I8VPCuopArw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794959437;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PfSPaVXedADf6rsPHU58q3NIdyMqzckShx4YfFgeiFg=;
	b=yb3Ba2lInP+iIdBfxL8+uizN1EOMtpLRotxW0s9N2DceNtPlVEjmQNuhu0Xqlts7nDfR
	 c+zmR/O+Iqt0OEsASzaxWZmtoYpVsbrDz1VKFLC8EUl2efIO2g9fgGVTux40tUFrNcjY8
	 dFsSLv4Eew87Y2UvFHgB7nT7tMR7WRCwdyw239cRxX6N25vj6WXTTTthb+6egmffzbiEx
	 p6Onjp0PrG2fGcz0zOqVIEepwKEeQjZnp1hw8/Y3pnc398OJDkuiJh0XljaZRaPNjn0WG
	 xg1o/0IEEn0G5DBV1z3+faUZ9zhdjMHmyx/UJHXtgPuROjyx1G3RsB92GhtY+Jpfbhg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7E031F000C4;
	Tue, 17 Nov 2026 23:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959437;
	bh=PfSPaVXedADf6rsPHU58q3NIdyMqzckShx4YfFgeiFg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=K8KNrnbl8lBUWSb8VrQVomJ98n3nsSPzVj7KAEVnnEqrwmFcbdhW0nR9d81rWPSW5
	 mNTO8O6KuJg1tEXiE6NxGwnIQmHgGtOljLx29+0naPPy1W2Ortm0tVkti456oBAG9o
	 eWD4o7du+NRDDXd/jNYZ+1Bs1jC1FFBnDNM1YFC8VBuV341a8IGyDkY0A/lsUsuiMu
	 qsOPr9MHtOJO+x4r6r6944wJ6EmlZqA8ssvM/qj9PckKo8+sKx6NPrumRfkNKrj42k
	 yz1bBMq1qIyMgZnJ55xl6Mr8SyY/T26vYvEYw228EcQm99rLHpY3sorFipvSAsw/7P
	 VdTRNdooqwc0g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3FA24AB59;
	Tue, 17 Nov 2026 23:50:35 +0000 (UTC)
From: Maximo Manriquez Lizarraga via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Tue, 17 Nov 2026 15:50:36 -0800
Subject: [PATCH v3] media: ipu6: declare firmware files with
 MODULE_FIRMWARE
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
Message-Id: <20261117-batch1-s1-ipu6-fw-v3-1-fa82baa8a94e@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNQQ7CIBAF0Ks0rMV0IKXqynsYFwMdLMbYBihqm
 t5dqBtXmln95P83MwvkHQV2qGbmKbnghnsOclMx0+P9Qtx1OTNRCwVQt1xjND3wANyNk+L2wTs
 lrEWF0uyB5d3oybrnap7OnxwmfSUTC1QavQtx8K/1aYLS++Un4Pm6RgqJ1rZaHOOkh7i9YWTFT
 +KvILJQ065RLQKSxW9hWZY3WZNtwgYBAAA=
X-Change-ID: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91
To: sakari.ailus@linux.intel.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, lsa.uz@pm.me, 
 mchehab@kernel.org, Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=usCgb43Tza/ZYUcfTrOovdSpxv/fAJbVp5Ig2JIdzbk=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFl/XngrL+upDX/WtKcq7OcNton/NJPWXpRL8ljVqCeyl
 L9LT9Klo5SFQYyDQVZMkUVMhud9/X2dOGurOSdg5rAygQxh4OIUgIkIGzIynNeRLAn+efh8eIT4
 Yam0+dsOXRGdl2bO2pgQaxdwv8ZwG8MfziOvU9NOvjyj+D4rbldERaef+C99Lf/ITeXeO9LLlnz
 mBQA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>

The driver requests one of eight firmware blobs at runtime depending on
the detected SoC (IPU6, IPU6SE, IPU6EP, IPU6EPADLN, IPU6EPMTL, IPU7,
IPU7P5 or IPU8), selected through isp->cpd_fw_name, but never declares
them.  As a result modinfo shows no firmware: lines and initramfs
generators cannot pick up the dependency automatically.

Add MODULE_FIRMWARE() for every blob the driver can request.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/all/apqB28RBDZV4BlDZ@kekkonen.localdomain/
Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7
Signed-off-by: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
---
Changes in v3:
- Resend under my real name (From/Signed-off-by: Maximo Manriquez Lizarraga).
- Fold in Tested-by from Sergey Lebedev (Surface Pro 11, IPU7).
- Link to v2: https://patch.msgid.link/20261107-batch1-s1-ipu6-fw-v2-1-0e8567a1aefa@tubot.lat

Changes in v2:
- Resend with corrected Cc list (v1 accidentally reached only Sakari and linux-kernel: repeated --cc flags do not accumulate in b4); no code change.
- Adds linux-media@vger.kernel.org and Mauro Carvalho Chehab to Cc.
- Link to v1: https://patch.msgid.link/20261107-batch1-s1-ipu6-fw-v1-1-1d5323aff7b2@tubot.lat
---
 drivers/media/pci/intel/ipu6/ipu6.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index cdf812c02960..ec2a9c2bf587 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -1028,3 +1028,11 @@ MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 PCI driver");
+MODULE_FIRMWARE(IPU6SE_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EP_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPMTL_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU6EPADLN_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU7P5_FIRMWARE_NAME);
+MODULE_FIRMWARE(IPU8_FIRMWARE_NAME);

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-s1-ipu6-fw-d62ffa6a3c91

Best regards,
--  
Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>


