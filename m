Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D297136AB57
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998955; cv=none; b=mt3E0WlZ7pzZmkpfWtbqKXGBzu6FWLeKpc3kEI3oc163Ng56DQD6Q7K7N1CC12t6kb/l8wAm4IrUV7hcrp6MdlIArRJkAdOfARISan/XZM17/PLvMUF+sqQ7qmiOFvWELPu/2eKWbINWo/noLIa6igJ0IVySpqV0d1+uHdq/yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998955; c=relaxed/simple;
	bh=v2KZVPipi6XWMmI7yyy1VlOzd+eNcHMfmFPUdEqS8do=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fdyouExreUVV7IKM1OYOF2x3E0X4atx3VRzOARcBESS3GBszzQb8KLO31F38+4rO05b3hz089ZYUc+tBk6JmwYUIlnqlrQfIUviUi0MRek/2zUimaiDyRxwetIwadmkJ1zhFEo5N0IuMXFG3QN04wGLJMKe6jDHj+l1Vs81mwqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=f0ea2NsU; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="f0ea2NsU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773998951; x=1774258151;
	bh=v2KZVPipi6XWMmI7yyy1VlOzd+eNcHMfmFPUdEqS8do=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f0ea2NsUqDxMiJbpeugzgTblbtdKBuecehJF/MUoNAs/m5z/1vPOpP0EynBLVpPLS
	 sU5l4ntLZkHi0JFdLDGqQI9KVw0/cENG8rPn8jpFpGkR3sSNJZFQkbOMs/jVm8jLoD
	 MXmJu+c29kpqq3EX/HFWmq3IdAlymy7AcL1LFdKj+LeCpEBDSua23XPlJcdqTesOls
	 wKwyl7w2LLg7A6QpfuTFW7tyL5eDwQrS8MyiSjgPVrh2TsspH+E8k/Fa91GvsBhxLt
	 tqlOzwA8KsR22JHoAQeiceUsfgf573X5zkhCjY4OFb9/yI3YjCkvHQYndqV0DQRCt5
	 ws5b3MhIt4ocg==
Date: Fri, 20 Mar 2026 09:29:08 +0000
To: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH 3/3] MAINTAINERS: Add dt-bindings documentation for OV13B10
Message-ID: <c7p2BBO_oMbyIRGS1nO-ktWtvrUeq5YONHR64JhJ6EXKX0n-elheAn8mlPbyvuKa0lJxaG9Bghi8_NlaXucj3_G6cU1JRIPh29X_bk0xZOE=@proton.me>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 5317540aff25d7eac338d83bc09b862164ca0d6d
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Antoine Bernard <zalnir@proton.me>

Add the device tree bindings documentation file for the OmniVision
OV13B10 image sensor inside MAINTAINERS.

Signed-off-by: Antoine Bernard <zalnir@proton.me>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..4576a55437fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19309,6 +19309,7 @@ M:=09Arec Kao <arec.kao@intel.com>
 L:=09linux-media@vger.kernel.org
 S:=09Maintained
 T:=09git git://linuxtv.org/media.git
+F:=09Documentation/devicetree/bindings/media/i2c/ovti,ov13b10.yaml
 F:=09drivers/media/i2c/ov13b10.c
=20
 OMNIVISION OV2680 SENSOR DRIVER
--=20
2.52.0


