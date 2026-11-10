Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344309;
	b=0li0eNSpHDTNYpyYGT0ka/hZ/QXbnBXYvMPlUw0SOJL6nJYpwkpL/l/1woMANUS/+4gS
	 Zv4kfK7OCUYsicx657hkjmrkIkFzdT/d71sdhsAKbjQofqVvDJyL3wFjlBRIi0nnHHCwr
	 erEGP94oCO1kNijQwx5cwO3LUO75iWQ9VOLHSVJq60jtD7nSpwRtpYSbulEfp7DoHJP7r
	 vAl/koKxoNyacUf7N/1hBMixCaH835SkdumeJXsF9/13TTT+qLLyzTCTIcu06T8EeAIfh
	 ZxTkYRZAFkdE40Z8NOiHCFXDj0blCXlcaVcczyyjPJi2ao/l48I1prxoboEusWSxC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
	b=dDadz8aNY8ddaj6WLqJIqBzN7ZWw6ZZEnzYOtBcw3xNfgLLzxOETNLrGiJtDcw3Yvs5U
	 kBWQmgpqBsvtV5Kq7q2MI6myBPVSg1G/e5K06T1Pn2Ny7RVeYCQthw1U8A98/PoZYqcz3
	 +iUX1vW+MrHMJP46L6zfD6jAaH/qHJ+RVFylj+Z37SPlcQGQdH9V4PVAwqsdHK27MQYKr
	 RziFUzx0Wwn8nQo23bPzN+atOQQN3sjyojHc6u2m3Z3vaeXak5M8A+MsJ9cj74JpIFn7W
	 9ps7hJjdQjvhaBkkCffCsril/ymBoeAoGW5SlxDYQ7snu5g9LkJ4XVW9gH+vyGDEDng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u6vii/wC";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74031606A335
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 20:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74031606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u6vii/wC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1683925f8f.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 12:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794344308; x=1794949108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
        b=u6vii/wCL34uzAZ/V4UU9sOlD0mAAHVKnWt+MtiUee6XFX3+EtYIBPVbQzyKv84YzT
         EY+NK1L/PGKAo0U0oqq/tBY0docNnoPMRDfJbD6/V15NeP9K8OwjYiosGEJlv6c9M9u/
         aHdIYdITM6DVEzuOIHGM2WXiiByTHo3UTX+UZPsvo07j5LlLSGTf9WdBfRnMJJ0qPSSw
         6JFxP9RyX3PadDCWVHHw/2S32uIea3zAmgznqdBD68xoi1B0ATXoM9Kh6jklmJUwU7N4
         UqYTXjj0uJFf/MZ6gHQ0bR1JNdaaG1+lM7dwvOAx0nKmZhq6ImK7aN7cKBr91ZjL2g2n
         sJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344308; x=1794949108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLM4bV8tdm2z9MSR7M8kpnc0mM3tftTsAj/9cIAHpAE=;
        b=rQUpG2komn5K3R17E6PmxgvykuWRekMR2I4mZItPsyOZIqGRFTndZquINdqgEaNWNA
         kEM/6BoNg+nyYQ2S9/RQ4aOWKPup5bWCQEnm6pc6YULsiguk0sWBHk8w8H6hjFgiLG1X
         R5lHlyX6xwGWygoUr/PFsfvtgJRZfXktK52Iu68GTCi7nTt9NEWydFFsEmriMxDincZR
         VxN4RC/DgB3tewnejKbFnxqZVHtbaBJOsFbdTl+Q+NU36X1j6GTNt5xpyiOWWmXK7pfQ
         Z4MR8hcKDTShKIYoUHC5KcSCWxUFYB8EjW6sbjC/pxYP7p4kQR6D/FitmqL6CqedlORw
         3Jog==
X-Forwarded-Encrypted: i=1; AL+hErH7Z99bPgITrkJUEVkNHukjJy8L3LYUevKN+nTYdeb81ium0vve5JIo8Vpw0XBQDBiufhk/Z3AJcY4/RA==@vger.kernel.org
X-Gm-Message-State: APuU4Z82f3EL1C5sO1FyxDwsmPJUP6Zp4MxYwzlnw7vO8oYAJjOSCjtG
	aYRh56bXiAmBQUJe/nHDU7NjgTfFVywtpb+wz65hWJP743Vo+fEiN9xL
X-Gm-Gg: AYBFou1HzoOZfXVcBIjON07/D9yApoRQGF39GPN5MCx7yTG3zl3lwcXIRwJZLv6cdUu
	csNo+0Q6JmhCO8rR7wrZsqOKz78hZdT4TJodlepMG9Ul+rlevG9u27TAd9UsrhSob9FFlaJVuh1
	G3klo427dY9dG1SqG3+xcvncU7503sk0Qu2FWk8MWPuTlwHT/w2JalBvdlO1EQkq1RCuWciwJZx
	n87v3XYTBK/JYYobzyQKCQWC/KR2mZ5gWbylyIQYRgRRAKS4/Lw6Ag1Otnpw2YB1dp+miTe0hAW
	/u8M4dud7jW1hLEZV9aHcmO+xrx2Caonk7l+llOTAXo8XNPuzkCvzyT1FUeQaRkxubDA0vSkDMi
	A5S/AEOKi0cHZbSCrWnHSicTqA0syJ6PfDse/Z7nFFAxek7IqWJE+yGHSVjZ8G9ANghWPSxQ5XA
	SwtcfoX36mWs3qx1WB/XB/GdoaFbC3ouq2O4QLbJMzxBadm0Un/LHJ1Bp02fKfaOh53e4skRG4B
	iDDVK8vavvVjmWGiHlrTsp4Rs8PQ56PbEuegvMRe3dgNjEqDP2vfdj385tsZol4E/F32P5ugw0y
	a3ZL2wYuyaeoGIPopyhwUbQG9DpyHQfWzqT2NqVoUEA3YZdsOcC874x+il6MWr0GTp2rdcb0OPQ
	pZK/dmnqu6gQ=
X-Received: by 2002:a05:6000:605:b0:491:e062:383d with SMTP id ffacd0b85a97d-499c931ffabmr213029f8f.57.1794344307651;
        Tue, 10 Nov 2026 12:58:27 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-499823761f5sm1662790f8f.2.2026.11.10.12.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:58:27 -0800 (PST)
Date: Tue, 10 Nov 2026 20:58:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, hverkuil@kernel.org,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 kees@kernel.org, justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: radio: Replace strlcat() with seq_buf in TEA
 drivers
Message-ID: <20261110205825.18b42b0f@pumpkin>
In-Reply-To: <CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
References: <20261106074639.452630-1-nikitash.mariiaw@gmail.com>
	<cd073632-0919-4015-8daf-39cfe24391e8@kernel.org>
	<20261110135444.7d8070ec@pumpkin>
	<CAPDEY+X=pVsiY5cib8e_Vu3KNW0QNV6hXF+GSLs9gyD8rMXa6w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 10:41:06 -0800
Mariia Nikitash <nikitash.mariiaw@gmail.com> wrote:


> David, I also see your point about leaving strlcat() in place until a
> more suitable append helper is available. I'll revisit the approach
> before deciding on a v2.

I really don't understand why strlcat() got marked deprecated without
a suitable replacement.
The performance of any form of strcpy(t + strlen(t), s) is horrid.
The only extra issue strlcat() has is to do with it doing strlen(s)
to generated the return value that most code doesn't want
(and in pretty much all reasonable cases is actually fine).

David
