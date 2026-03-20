Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF0131B11E;
	Fri, 20 Mar 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998579; cv=none; b=hCafBPVVzS9oMPfrAIraF2MflsD1rnZKQlaSTF3Fxaakk6TGdCLMsYUBahSTe7MPd4e4HbHC8h0BUVtUhYqRJZV5mVigWJkirX5bcv9ZzREK3VY9/8RwVYAZFzAZ99s0A7y4JS6UxbxbL6mr8FxFKfOKyB8Q1QzIyeasDmH5kWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998579; c=relaxed/simple;
	bh=uvt7eL4Jq19faM7egA1KrphuuIDdpSBt1JSRf3YV6Sk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B2zmfRUUxDeqDPtQIdN1vNXum+M90DLJ4a5jDAbqtWjmjVs2NAHIa8AHs1Cmn+6U7se6nSMTT5I6QNOUZrOKHjcTLVuvT7OJkYQiSRdoF/xrvJyfI+s1FOGlZJmTj5kyp6MT/RdlCqd6VvMDdBT40mx2ruSjrHruKskTQqLBrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=aeWALAkB; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="aeWALAkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773998570; x=1774257770;
	bh=1+6+OuqLNU5W3FgsGLC7SVKlN36q2Rny0bniN4QvqU4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aeWALAkB2CHElJQXEFqvE5TiSepDXTUAQOkfhqQdiIp44Y5fq/8mfMQXQv4pDliYW
	 h3Ub2xZpdC9K5RRyTTz+TX1pOLJKIHAaGddjyXtfV+J/+GGsShLddGmyHiX1ZJuuF7
	 v/S7+bpxqhPR6Wbz1AutK2ETVc/NG4BvvQKdhARoxOTOmF+nKBrAEgNghfFvkU47ic
	 kYoUT4f17jEjMh89LVc+0/nBWDfahyBPdINftbqCGyL9uRdCo9P2Jz9jE4a3vDCdcp
	 n6lyrQ/+RHIzMuEkMyQRk0E6LCoZFT7ouWm4n2FtE1NIOjjuW4baOmy+E75TtkOIOc
	 PIvWQUtFGvSbg==
Date: Fri, 20 Mar 2026 09:22:45 +0000
To: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Antoine Bernard <zalnir@proton.me>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketos/upstreaming@lists.sr.ht>
Subject: [PATCH 0/3] Add dvdd, dovdd and dt support to OV13B10
Message-ID: <S-aTRAGCAJIG5fKj0dhR7YI1RgL2Q1sbAiLQFKciU4yNuGHwUcukxDGjYilT43Bs1VXFTvi9NSb3W9z-raiOscEYSshOTEr5MvA3TxICHlw=@proton.me>
Feedback-ID: 152853527:user:proton
X-Pm-Message-ID: 5efd933e43521df97088a077b927d5f8b895ee5c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series add support for the dvdd/dovdd voltage regulators
and introduce devicetree bindings for the OV13B10 image sensor.

Signed-off-by: Antoine Bernard <zalnir@proton.me>
---
Antoine Bernard (3):
  media: i2c: ov13b10: Add dvdd, dovdd and device tree support
  media: dt-bindings: Add OmniVision OV13B10
  MAINTAINERS: Add dt-bindings documentation for OV13B10

 .../bindings/media/i2c/ovti,ov13b10.yaml      | 99 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 drivers/media/i2c/ov13b10.c                   | 53 ++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov13b1=
0.yaml

--=20
2.52.0

