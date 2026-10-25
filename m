Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948136;
	b=a5xf+ZeRdkunYk/R7SI73TMLqinJOmhy8K0rZrEWXEXtDn/b9i+rcL+U4L4toljuJ/Un
	 Xl/kXzljC1qxe54utQn4mvsgSsPPc5j1fSzq95HKZT8Ko+g+3TCrDdwB8F/MrYVpz53xV
	 GGy6ZzOYVvYiD5pDbz8vGu6IkZryoCPPzaeWs/a0FgyPmPHOySaLA7d1DmVe9QK8Ylz0j
	 PP4U2isVINJ5hbXYcoHKjgWZdd9kblmFllQMw+MHCsYjpPHVnspodiYuy0cCxf2u6GQpk
	 CqTf6n3X7DMtMUCpwRg6Ie4AgUOndv5f6KOtfkBqOGS9RGxSI6dNEpEKzuAjo8TaekA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
	b=nuW99eEKpCJu3jJYYGE10FPATLJDe1S1nZTe4QNZgUuyCSmVEynbCyprXPIizN82QuAT
	 dbwn3h8LtUH0x5kBRAqnZleGyL3w8WcsrQtZuGaudA+SHRziiCsE64whwMAsXsklVh1w1
	 QubqFWSOT17HlUb6qhjFGI9vSlGlGmm+zxdkhxxCcohYM9/MUKSGLwjvhravLfGXl5KLQ
	 ikNF7496upCZktyHLn1CX6IlLeA7OZFWbpQD8yJt+BdZThDpNQaX5avJ9NL/nVSpoxdFn
	 ES5HEApZ2apMlHddKmNJZEOWXJ4fSv6sZV5yEH5atqQTatYpbMfXb+HT0oCFFnjwKDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYqY6Q4O;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEF3606A31D
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 17:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AEF3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CYqY6Q4O
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so2093575e9.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792948135; x=1793552935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
        b=CYqY6Q4OcehDG29INBQMKR4DaLuONQF9Z6+RYnqmnDxH8Prqnk8zLhu0OssqK8Fadk
         QvajBSpOcFKRkCA2xszuAfcfxi1prXDBFnNFScwM8SjERibek0eBd179bd4hGgkDi/F1
         v+dnsUUslGayU+J2YPHOBPmGkPpo7MZ02TFElh7V8ub29tg4CJqDAR7rGTz7OU7cIi3b
         UlF5nXWyCfIvaTb2I4mYophdOcDZxMAQj4s3o3MXBj9vZ62S0ooEJGMR2u/xPcU108Pf
         VCQZYG8iOo1j4Ty8YfSwAiSFZk/lSClmm8Im//vd0+JqmHNYcJWk+OC2goFZ4XrWXb29
         0GaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792948135; x=1793552935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rhM/Sc+o0ysPmMO6fSmK6vzOuXvtLoA+qk1TN6KOMFc=;
        b=k4elaLDRJNnXhdYptMMUtMhLqjIPNIdeRTqJEpTiU8z2JZR9VI3EwhqDS96vqo6oDu
         oDUk1MJDxSqCA7iEcztvPiJtN602+taz2X0Bh7UxYDiGpQkEJMSOJoDAdRSSYG61VdiG
         tnacVDn9VsUFgl1f8O7ZTiXU2ZWjfuG1ED/OaXTRn/W2cYveKYLArXHiWhx9x+Me+5bJ
         9DMSTeE6bzBpJjmPd8qI8aNhmTvZDt/0BWlpWDuqIH7G/qdRK4Z5/JYYGMNYpE/cJ9+h
         fPUJj2Up4PZIZ1vsev5wyjz52fCrRGET+0OzQ6sAZmDf67Frx2URrtrfABV/CLIX3qqs
         SQ4A==
X-Gm-Message-State: AFq9FYII8uADr1PxN2UhycXkHxQDZ2JB0QAF9NCoMqkY9wsvnrke3mge
	EDG+Ukcna45VryiS1kb8KryirVn1U7BjN9FZ0hIiEOn1onwSDpUs771IDErAJ7T1RvY=
X-Gm-Gg: AYBFou3UpfFqE525p2URozphXK28GsVQcuVzw538KAWehD3hJy0yz7lOGwRiFZ6uz/C
	g7js3h2b2ndyYrxieUiYGF5Crn5kB2CMTYFQ1a8zBsAjk+Hbibw30F1flrRJw3HJwyfrwYgRVNg
	5NZ9aGFvarVxX1NTAeJy3VvtaHyga3RYYoi+hhUyIVU4Zh8NGEpknYvOlfnFKvYjTqzSsyW0bhD
	XZT+7VmZ7gj36VUmktLEhKdP/sqewpkhRyyZGooUzprVwxQqO/pU+Nb/XsEtTl7IKBi/QOUnf5W
	C5cCOlt0vEDS4JnqpAZelxi+M6rumyDHgP6ac5DD1KhnDIaj84vmcNZ4Pw66FxL/YBVuOVpGPiO
	w82EIyklco8+kvKEWdUWRTF9F+33w1wwY7DWi/HU+M88k4aM5kXdmjFzwq8mv3DIVqIxA1a/lh+
	wPlxY19HDoDa1Q3vt0/Ey9F/WevllAlsukg/S2a80EqU4pi23lB3pg4bxl+4lAb1fPohoySVAO9
	osYn3mHfJcB7uP2+1ssiNha6ImDh/WlWjZxBAR+1w6ln4MZ
X-Received: by 2002:a05:600c:1c03:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4a642ccc7b2mr10435695e9.17.1792948134926;
        Sun, 25 Oct 2026 10:08:54 -0700 (PDT)
Received: from fedora ([39.51.119.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm11352202f8f.46.2026.10.25.10.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:08:54 -0700 (PDT)
From: Muhammad Waleed Badar <walid.badar@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Handle payloads starting in the middle of a bulk URB
Date: Sun, 25 Oct 2026 22:08:41 +0500
Message-ID: <20261025170841.46175-1-walid.badar@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <af1ff8d7-16a3-49ce-86ae-f944978f869b@kernel.org>
References: <af1ff8d7-16a3-49ce-86ae-f944978f869b@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending as plain text, the previous copy was rejected by the lists.)

Hi Ricardo, Hans,

On 12-Oct-26 15:04, Hans de Goede wrote:
> If I understand things correctly from the email thread + previous patch
> there is only 1 USB vid:pid combo which needs this.
>
> So although I'm normally in favor of heuristics over per device quirks
> I think in this case a device-quirk might make more sense ?

Thank you both for the review. Ricardo, you're right that v1 would
decode trailer data as a payload header and break those cameras.

In v2 I combined both suggestions:

- The URB is only split for devices with a new
  UVC_QUIRK_BULK_UNALIGNED_PAYLOAD quirk, set for 0bda:579f only.
  Everything else goes through the existing path unchanged.
- Even with the quirk, the remainder is only decoded as a new payload
  if it looks like a UVC header (EOH set, bHeaderLength fits the data
  and covers the PTS/SCR fields it announces). Otherwise the URB is
  handled as before.
- A one-time "UVC non compliance" message is printed when the
  workaround is used.

v2 is here, with test results on the affected camera:
https://lore.kernel.org/linux-media/20261025170220.42789-1-walid.badar@gmail.com/

Ricardo, Mauro: sorry, I left you off the v2 Cc by mistake.

Thanks,
Waleed
