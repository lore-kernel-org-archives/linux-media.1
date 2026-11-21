Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279775;
	b=MWNawDjFmrqiT1wqaHoQGsjLNEtpEwHg8RhmwxLdrRafv6t2OvNK58DryzJLvBLHjiq7
	 7yRgG3BlNwI8jOe/Nt/EkVIe5fM3zPVsYxTATdGNUkRe0irXwVi4l8VFGhTO0rrVkJz4e
	 zUFtdBivT3pw/uTQGiAG6c4sUWL92c8urfilNig6Ma8moHxY0Rj4M9ivjyzM2HjZO1e+T
	 hvViXRO+s2BzVJcZqSs4cpxnPCRmk7hr6BseUDjYJKuePjvoYcbRcTCqMLWoDwEqisc5n
	 RS+Qbs/GF+Cz7jZQAF/CL++JK80metIzxOxAfavS5f9qQ2XRcHqvXB8VIK5psyGVUvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
	b=n/CQ2DcOQ+pj2F7JMCHtBQwXnLJpKoRH6s6wNayDYf1NhY3h0+rTGSGaVK9MZwoz+cNK
	 za8xwlByBZvnhn0aCGvriwvzHjlC72G77uOOc9dnrpreghtxf28FaAlq9W6a3ZzjUtAU5
	 AyQ0y+Z8osMA/UQtB27eudgDNsx0kkWSlR/j2uum078Q0Zla+zhgF8h6Yq8Z471uKWoMM
	 R1sn9WeFWkp2CUuVBzMLg/1LVtS/j5lX4eGDIKh+fT9BbDL0NHgxsdcBbIytan6Gexpvj
	 HDJcm3h8nfpbc010AZT1a+NZ2xs5piPW0Qj5x/9pcrlkzkeXnNAuXEOLPXjfauuGQXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE7606A330
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BE7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OdcooltJ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so1706060f8f.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279774; x=1795884574; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=OdcooltJshgvnRM7c+d/FGFvp62+GJqr7tPTVT3YQ1ew2d9S63WxhaYLBBMJo7Rish
         W0jFv7E+bumkwunAAIGW3/h1O8hR53Mce65f8w7P5dd+K4xvASRMIHo6FgHTVG4+plbI
         SLEjSMPhJ22OZpuOK+En0GZ9ZiMYu8oirKRLLUuXOTU80hnFa8601onbZ3qHt6gXDxwj
         m3QDaylwAlOAcskZ2OhBE1pLKpx8foNt4cdlL5xCoVbVYlv4mCBYod9ShLAFq9WuzZT1
         b3gR52+oXacMOpqxOKLS7gSu0HyRtvsVNlieaFvfxpA15HZqvZL8K07lYpZwGiQFj7sK
         /05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279774; x=1795884574;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Tr5CKU3UlzjWznuI2jt2cmP/efOOLT4RS9lkC9TSPu8=;
        b=xqPlrb0ZjgKfitJ7M03rw+WUWLtrsfKohsKZHwERm2eCo0UCIhgZCQJknQXEd6rcze
         TzT0v+z8w7FsbCC15grUMZ/gFgDsyYVtgOXRq4fp69O2svq8PNDBOU4PPxy0hN0jCKfQ
         /LsThChkle1McAjNLM20HMl3J9KhZTM9qFZ3Y4ETo85u1KYRq9eDxsKsrQCljn1A8QM9
         r3vUjPn7gBhYvVTMGQTdCLHfQjE8nrVqWNCtBAlyv+BL9Pz5oVpaxJ3ZezkI5wez0ZjN
         gMMUdu2zJmbVbR6CW+CmcIimHrT//WUBJBMtTmUOZj7URCshc8LCYMRh++f71ta/lVTK
         nOOQ==
X-Forwarded-Encrypted: i=1; AL+hErHwfM9d0TFgSQRXyx+P6VWBr5A09XRSDsB1sNfB9018h8RSRi0zMNqWtuokO30bdzL73h5tYBP081Wwqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/3BCwNOBxVVSU4jI5nCtJk2KSsjCelwHyoWKNun0HZiAxwvJg3
	sfFQm0icn1ZTLh5AJ5Y/+MR68tWuEd36849j3ndcmn8rsyhpkLQMLpzR
X-Gm-Gg: AZFdTZdGZQizZ9KV0bI8ujX91pIgIxxWi66DvKV1NU8VPGqNo3zVqlIbTP9mGFn0C3f
	2G4IRRp1JjTCHXKIv8vPWwCL42JkqrNy1G5wnK3VQYTTZgremfLnNwDn/W2GfhMPmesTRuBvdao
	jbFovyQs5PPyFB8EzIwsvzqipYisjgJ32nPJg/aly8u+0PR5+o61fHX8zFUxCBcrYE4BJJ8N909
	e9xgQJVjx5tzve23qCDccyKDEoLjVWLqo4UOLmd+9VUFWxIMkQ0IlFbM26+gqxRjxSfAxWrlz1h
	B8T3gwrj+/2xviOOVGh+sARgx5O5QqNPLa82HSUbS+OcMZdrFMfDJVI167EAYV7FHrSurD3fFGJ
	ouPfbh8qYP/OrLlCeL7FRTxyJ3RbAw7MlyPcF+lHQZOpVKvEaTC+SXHav6/SRtvCA6TXfTppc4+
	cMP0F0zYzkuIiz8QNk0pEEauIrtq++iFPKXTfnIOunbGP/wksm5US/WC8wxTYtg/8/bxBRH4wRr
	rACtr4uyjYIbdr2qFOgMQkk2ORtvn45ibBm//jnsVr8emuMpMVV5FXz4AGLt0ITzEKz6A2nTDVa
	7kIWvHEypcJ37eZOxip0gR6Px3slReI=
X-Received: by 2002:a05:6000:29cc:b0:4a9:32c9:a6c with SMTP id ffacd0b85a97d-4abb43deca6mr9060540f8f.50.1795279773669;
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
Received: from unknown.local ([2a02:b027:11:696f:25b0:e663:79f5:e891])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm9761749f8f.35.2026.11.21.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:49:33 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH] media: dt-bindings: document the Dongwoon DW9763 VCM
Date: Sat, 21 Nov 2026 17:49:04 +0100
Message-Id: <20261121-dw9763-v1-0-f215290602f0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyND3ZRyS3MzY90UQzPjRNNko2RjI2MloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AcDXonGoAAAA=
X-Change-ID: 20261121-dw9763-d163a5c2c323
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795279770; l=692;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=VFe6rInvOpcbpjq2cBpErG4KxA9j/Y9r1X0v6h+zhYE=;
 b=N9bApgpYBwVxB7xDyEKPDEzkL/ZOO/P/SlJmM9T9fKdCl3jhJ1rEKJxw4rPB1UjuXyAXn9Qje
 c4Lnp5DPvgEAFM+fzXoY/wgd0DT5+jfjdjrKFbulNhO56PJ21VwdRw4
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

The Xiaomi Mi A2 (jasmine, SDM660) has a DW9763 on each rear camera.
Both work with the dw9768 driver as is; the commit message has the
register comparison. The jasmine camera DT that uses this compatible
will follow in a separate series.

Discussion: https://github.com/sdm660-mainline/linux/pull/267

---
Gianluca Boiano (1):
      dt-bindings: media: i2c: dongwoon,dw9768: add DW9763

 .../devicetree/bindings/media/i2c/dongwoon,dw9768.yaml         | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261121-dw9763-d163a5c2c323

Best regards,
--  
Gianluca Boiano <morf3089@gmail.com>

