Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49E7409103
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757695; cv=none; b=ZHxrWAum+F6OoIwNR1s1NgSM5iq9bPB3yNRago1xdmJ1BQZ5TJgcvL+VE/xkGDyG4GqauIAV520CcbeRci+6yExTgLZRrdrw01LIKVmb7PSzigaZ70ydl500XqRZ+D6snoVULKPaxWsr5VhWkrw+0pfPQKQ5xmN6oDwkMYfw/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757695; c=relaxed/simple;
	bh=kFriuOhaNnjZk/B46O1+32ucB1JapNpRC0Q1aWQ8dao=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=jJW+So8jy6WhEdiuXwWAuKmlekC3Mu4m2UxGXaR2hg86VcLPJ0dJ59kgPMXSG40FswVB70lY+2RDXi8C+UCBEopQ2BcxRpmSrSE4An0weymiSwbuClx/F6ixbn1MeUoiClxd9QI4r6/v9f5Xa1hw+YeDXds9VJJ8kC4HrN7J43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drake-brockman.id.au; spf=pass smtp.mailfrom=drake-brockman.id.au; dkim=pass (2048-bit key) header.d=drake-brockman.id.au header.i=@drake-brockman.id.au header.b=iyqafqtz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kxXeHS+d; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drake-brockman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=drake-brockman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=drake-brockman.id.au header.i=@drake-brockman.id.au header.b="iyqafqtz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxXeHS+d"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 966A31D0078A;
	Wed, 30 Sep 2026 04:41:31 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-01.internal (MEProxy); Wed, 30 Sep 2026 04:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	drake-brockman.id.au; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1790757691; x=1790844091; bh=1IrALn/xGk5sLlRtkJ//ANPApGDd613U
	QCNJLZqm2Rs=; b=iyqafqtzW76Vzl8VLtWBVmhEL5yvjEBiCSOcAEWK2L++vVUL
	cDgOPwNg4LkmNjTwFrEz1Uki7C/HI7BQCqdjFc8UQtKCfaE5JO445E/epIKDr5f1
	4qpygMaKbBEekP7X5OCW53cMvRc0XM9BkRbhq222oSpru3TGyDRGtH5BBvlr87KL
	lKOdcbVzOCyMbvWlBiLAMaXa8ACc+LEgW5fW4KV3eb/KZFhCkI/chnIi9XS/0biT
	pFfd03sQfcfeQh0vIJy8RM+8ft1wV0eX1Fn3EFj/XVbDZ1iWH0031rFFfeRT1wWI
	oj/fKoJn2bdTT6HZiIOSZuDHB1qoMGJeaK+8Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1790757691; x=1790844091; bh=1IrALn/xGk5sLlRtkJ//ANPApGDd
	613UQCNJLZqm2Rs=; b=kxXeHS+dZjXz7jr6ajogwZ40dUebUetpzmehysqN91LK
	QQpP4hapuAlwBHfHZfOkJTsAo6Xuht6YfcngK460MJ1fWv0GHNMi6qHhYEyHp6Ka
	G6guETK8h6edvnjs97NGzStBW9dWRpfJ+8rD0LKKLe6sr4xKf8iTH7smYN/Jirlk
	DtRZrzMGGdsbzmbbh8JT60CNK/ZnaZVSfPRtgtbAizom8k6N5OGRnqdfMEAMuNpp
	B9wzaRtG6gZhHWxONsYTdLUCYpCKK5tephFD/wY7WsLrMQ9S8HCLhtmoh9Qsuj7c
	hBcZ++6UfuFydGiz64lvxxzYeumRlt8I9SMxo/odSQ==
X-ME-Sender: <xms:O8u8aglLx0cxPZVpAzOb-YWRoU9KWUcEBp0os-qlMy77a2AWniSv1A>
    <xme:O8u8aqrcH3NydwK8CEzpjiM48KP9FUDY0GzAscvMNTaFq7ik1C8o2Q6w-FdJsIutr
    qLLF3T6UTit4qMB7gYkc62UUZgrR9kYKWOl8ryqHwNR_34gIUj2qw>
X-ME-Proxy-Cause: dmFkZTGL26CLtt5LgulrBsczOqoNvslw09F+DMmy+ThBLX3q5vvBOZyV3Zz+53hjDb74MO
    XIYCLNrlig6sjqPAJlMoA5v+gKN3axckW2gYsy2vHAxOBimQtWIxr4sgmdA1DQLpF00DtJ
    dKQopG5QHdCKjzaFQ9Zwu8unf2P3zRQe8vwzunhJQzMaqIbRaGAiQnCD7sWOkRg833Qjis
    EikwOk5q3uzfj8e1HfSKMyqoU2JY1wRnoax6zohewOK3GerVHwDDbXOA1piqz635W+6Kgy
    4kmGWFW/75KA1JVQ9p/AQ/MDNC2BfBmQhE/MhUjY/rZtRnOy6TgyZ5WsHufbMnSypBJ0KX
    23lcInKVilGpMFU1JaLhcCgLqIO34sPXRznXgYJw9vgkeMc9bCtgvZAzUrp2hd0+cMOpdJ
    TJHJ8JuLSJytveTDpocFM2m15+w8Z2ynHiJhtrV8fVQeOxp/Oo6KG1/m0yq4e4DfccZbWp
    F9pnBoXjrbvvTTefmYMlFjXM6zwq3PtBPuhZCDsqS162NoGpM3niKirfIupLKb9HaK+2b6
    8IoxfE2hPizqFmfnFt2wBRwS9G/KimD0J+OTSHzDeiWqbZ3lE19gWLDb/R2x7lDWbshbFv
    BG2r48PQS4WVFM5JI2194mtmSEIvRf03ByfQ4Rk/ASu4ZpZXg5AGLMrvqhEw
X-ME-Proxy: <xmx:O8u8aoJ-6l0-NQ9fQ2xmbbnMLJA12JxGZzD9EQkI6RDmdVUYZPZF4Q>
    <xmx:O8u8aoQq6hDWxaci-4vxZte-IlnjDpgLuJ3Mk1UsHUMQuWcT1FZOGw>
    <xmx:O8u8agq8aa3CQB40AdhSP7QLKxsKHw8PE366Kbmc8b-SDx3yeNHTtw>
    <xmx:O8u8atrMXD2E4dGeMg8IKkBNZbc6PWbEVRxR7loVAXDmoVqtt55-TQ>
    <xmx:O8u8ao2ke6_bmUTx7gx4eNgUK7ELxWqCp08YXH5uxhrTLdlOs11jAGKZ>
Feedback-ID: i40c0427f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26FF8C40072; Wed, 30 Sep 2026 04:41:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 16:41:11 +0800
From: "Thomas Drake-Brockman" <thomas@drake-brockman.id.au>
To: "Kate Hsuan" <hpa@redhat.com>
Cc: "Sakari Ailus" <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Message-Id: <35240e45-c73b-4425-923a-c1026386ed3c@slotpi17m12>
Subject: imx471: frame timing ~10% off & digital gain only affects Gr
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Kate,

I found two issues with the imx471 driver while tuning libcamera on a ThinkPad X1 Carbon Gen 14 (21V7, IPU7) and Fedora's 7.1.10-200.fc44 kernel.

I've been doing this with a fair amount of assistance from Claude Code, but testing things by hand. Hopefully this is helpful.

1. Frame timing doesn't match V4L2_CID_PIXEL_RATE and V4L2_CID_HBLANK

The driver reports pixel_rate = 160M (link frequency based) and hblank = llp - width = 2328 - 1928 = 400. With those values, userspace computes the frame rate as pixel_rate / ((width + hblank) * (height + vblank)). Measured rates from buffer timestamps, raw stream, 1928x1088 mode, 130 frames each:

`  vblank   measured    predicted from 160M / 2328
   220     57.817 fps  52.54 fps
  1433     29.998 fps  27.26 fps
`
Both give a real rate of 176.1M "pixels" per second at llp 2328, so every exposure and frame duration derived from these controls is ~10% long.

2. V4L2_CID_DIGITAL_GAIN only changes the Gr channel

Changing digital_gain scales only the Gr pixels in the raw output. R, Gb and B stay unchanged.

The init code enables global digital gain with

`  #define IMX471_REG_DPGA_USE_GLOBAL_GAIN  CCI_REG16(0x3ff9)
  cci_write(sensor->regmap, IMX471_REG_DPGA_USE_GLOBAL_GAIN, 1, NULL);
`
Thus puts 0x00 in 0x3ff9 and 0x01 in 0x3ffa. imx319 uses the same register and writes it as a single byte (imx319_write_reg(..., IMX319_REG_DPGA_USE_GLOBAL_GAIN, 1, 1)), and imx355 declares its equivalent as CCI_REG8(0x3070). So I suspect it should be CCI_REG8(0x3ff9).

I'm happy to test patches on this machine if that would help.

Cheers,
Thomas
