Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128153B6352
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895283; cv=pass; b=shS65nGAFMu1nBI8kjbY3Sj5jBSS17NTAmTREToDmcrrlTj/nq7MqCzpevWsUcG776FZdC5cN69Cnkn3bkajn+8XJZ+39oSSj1EFRZNOEsUeC3xgnC6UHp2H2ivC33bLy+UOko6z3b5vl837/+JOf+EOhxzufbeHzRkmcvVWUbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895283; c=relaxed/simple;
	bh=cEY/7F6hxlj2M33/z9kYfEixWJEkSlqFR7ES9U/Z1II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imFpwZVxdzWxnOBaRYr/lcJEWuHl7kEsejvEoKHQZtMEtkiCSJyHXO+Hi8QuW86j6rrgTremELy72rsB4gwzmyFA8UTd0Z9zDOjfczHhFMarUwEpiG0/xAK2ZrC8grFknDSEKEhfVjkBb5v52AJ+BMfqpMx737h3GIFNUr60YVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAIC50n5; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAIC50n5"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so801858a12.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895281; cv=none;
        d=google.com; s=arc-20260327;
        b=eZG+aN7y8q4N8AtGNBcYfHV0eZVMZTuK0ZATEdtwpTcSQVWjQkfAOsGuh/5MgvqGfd
         +a5l6UbmGeDevzZQfMSv7xEt7EezM4/o466MyJbaGdx3uUtQgUe+CIKlv/CviS0wNZsj
         +ftx1mkOh4AWGb+0zhRTH01PHIt1UJq2dqZIk5Z9fQ1qywvf7zamMeohvxL0b8g7TPEu
         +iTUIZ313u/Sa46on5l8j1/IZ/Oi0dKy5mswxtbleaMoh6c51OCp+aCpQnOdZAlea938
         RXPJyXOm0q9IT5hzxYZa+mV1Bsgjk1ucx8T/EKMjvrd7bhxZe88tFzeq2oQ0CGWD5mvC
         Wsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        fh=Uyk+gSDxDTnG5ZU45FY0nTNFo9o8NjBFLajDOrweZxw=;
        b=M4B/hsYmZt3Otu5X/WNxSnvbmJ9CPRuWtZ7VC4x+tSiBZaac25wkEYTy4pnycj/0+R
         5KNEHBX0X7QczDYASfJA9iLA82vpBAGn1pnsYjE+EbyOndaWQMCahF0dcC0HdFnTE3+a
         uuo9VL6/5QoZdU3caZsPdU+LzVJurByTvN7H8o/7895BH7bAvKU0vVzowICbPeQWg0xe
         lk7Ya1mvpTvk1iN+EheSVhA45l9MTriDK6u3IHYloQ5gtVQgzCyfauI25Gk9bvtqnEc2
         dxEMoeFfFohdUZ2v/YWRoDyKeeiznhnXcsR7/Tv3MFvc0mx8THP1+sFeNL/VvxTp9Mfn
         7LRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787895281; x=1788500081; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        b=XAIC50n5oKWUMuSEMY9iP6fBb40Fj4R2P9rPp5JhEJqV7WgHxCqfhC9hZjJr2EG6T2
         B6W2UnDu/ixZbWpRh1+dNEve5ONDHVt9i2b//wEZwoWO+tU4eDFtLPB+B34cpdfGn8L9
         XAxg/mjPbkYS+H4fSAPIJQtN4ltldNPtLxjqAWVGy1ha1fG7RdeaFul4YuluS+cFGTFF
         0Nmq8wjKbVaMhqj6lz/Kgmeeh+JUCLVPWmWmipGg5bN42tnH2qZ6UMKgTPRW/rcDZPlh
         7U5Sj1lbVHTgHn/kkSq8uRqBeEt2eKS1ryhagkRIIhON4FH97E6phynoq3ze2aNVV0xV
         8aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895281; x=1788500081;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FvFIIR/g5aSuLYP11ok5JtcGs4xSiTP215uJf2XZbHI=;
        b=A9HmQdBOUIGcTqqqwGxuwxog0Ct5gyE6JwCvBfAvOqO98ODcVl2F9H/0cqEVoI2Rke
         HBVXSghX1I+bF8SH9oYjbj6NS5pcMmALhMuB1FWE3V0k7v915otojvny972jvTBynjvZ
         Asp0vi5ZDpkT1xpO1mEhJvi+9W6FQo3tmegxDW+L++9LxxPqP2jhD8is9diWVRJayiDt
         9GS8iqxBbp8zThcgO0fWAIjX8uzmUQdlEFcCZDzP1wYH3+DtpijwYsN3dd4IqmW8Yowu
         /y4C1f52sHVbsD7cAJiRAqWC21IMhIBBAM7FuXDBn7fVywtRjUstg60op8vFeNodszGs
         0Hkw==
X-Gm-Message-State: AFuF++nCTzCzfcCUwyKfU0bDzwM4TJRLz7DxdtumWkE2vf3yt8oy2gFT
	xpNuagt5cCFGAOgsdpI77kIQiskhKV+O67Z+Xtsla1MNRcbqxPXF95yNM5Q/9EsXp81xX2A8z0r
	t9IxyizlJtEfKnLbrYVX1bZycnZb1WtM=
X-Gm-Gg: AR+sD136pk/jqSarZ1xjD2DD03TwW3xoprmC4MbTPkcqe4z6+ZVHOn/Rq5Uc30WiEmd
	nIL8yvwvIj2mSpKk3pFL0MSInpLCbPvZa+JYhiG5pMTqfs0i4m7HDxzFsFz62CDyj+e0DFySfLh
	A21wkB48nYVAC5ZHJKxfS2cdIXwK0IgFkSIFbpwI+8AQxpgjnzSmG8d0gHyUNQFx+rMKfp3r25i
	LyYodXhoMZqbhKBwRbOwK8QyY28OtL3NXyfTTatLNHdzzr0FEdtj0E6ybEZ4Cxfkqke3Z0MHIwz
	IY7kWtt2mAP3TLeStZw4Shf+VjcMeTjxlv7mceufaPWIkmdgtnki3tQd
X-Received: by 2002:a17:90b:5747:b0:393:1d92:db5 with SMTP id
 98e67ed59e1d1-396d0ebd946mr9212807a91.10.1787895281176; Thu, 27 Aug 2026
 22:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-chubby-refined-partridge-2efca6@quoll>
In-Reply-To: <20260827-chubby-refined-partridge-2efca6@quoll>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 28 Aug 2026 08:34:29 +0300
X-Gm-Features: AcwNN1V7x3xE7UHCZlm23CotOK8dmsPPSKaput6Ehokphr6OrHpi0DVRxlOIntg
Message-ID: <CAP1tNvS1nKEh=O1e6NGXFu0L2DWgEcC-kmRkfPXqGOoTvdFLsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> Plus, there was already v3 here:
> <20260306103614.3208182-1-eagle.alexander923@gmail.com>
> so how are we supposed to compare this?
> Did you address v3 feedback in this v3+1 version?

Version v3, which was introduced about six months ago, was labeled
with the 'RFC' prefix.

> Drop second/last, redundant "bindings". The "dt-bindings" prefix is
> already stating that these are bindings.  See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

You're right - this will need to be fixed.

Thanks!
