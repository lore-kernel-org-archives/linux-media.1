Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810020;
	b=sTx39iGFVba8RKnRY6LFxCGcwzQs6+jOwqAizLOBdYh87/JOwfDaXEzKfH5PQ/B/Xj0P
	 f9UmdG7l1/WZuv5a6FeLjdT5XCZMbhmraIe+dOgi6BoEe5KnhqVvBkmsgKp8Qt+zgnhKq
	 +wr+QumJyDBZaa7QvqPbez7ZwTdnc8qJ+GRUQuWA3y6/9QiHrgsjfxCUwdasSHmQD5CBP
	 kVyUWnxKutO4PQ4LEB8JHbK1Oj6oeDVhO20lgQMxFBKG7MUTzC4qPx8JJJ3lRGbxiymE4
	 ISV0C6Irf2SpsS+ukdy0gYjFZb6fqIwS1Ln/cUiwlsL4z1x/QLAFI+ZKtnnkxWMygig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
	b=eglnK660TWYBlsfcikwi3f4WYNYk0Xqug8MkZK7SJct445us0OpupOwbYe/ElUvtZu4H
	 FKrLmSQQlw4JjvHtfCkWpZCZPc003N/39nE8sj80lp/Uq7Kh0RSfFVQoHsivrC37k+leI
	 ukeABudqNnj+XAYT0rORqA7kA8qBSsbU7UiPTC2h02vuRvJz35aV74g+PVqd7AdzjK5dA
	 KzxMe2J8w6nH/Yvtf/jnPfEk0Mcs24Kgb3ShIwSizbH6KWtQPOLCb8nvomjC8fmS3AKqH
	 Qh1bc/g/KGWhti0yHwhr5XSdy7jW2SN2+wD6KTquXvgCQ60sqX4lSEyDe+hsoGULoqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyc5+OS1;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC6606A330
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64CC6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyc5+OS1
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so3365765ad.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810019; x=1794414819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
        b=oyc5+OS1YhxQamlQ+lMzRkTUgMsruE6SCyj731QUPB6nYUbiCQDd7OVb6Va5fCTE9q
         4TZ5+JMcKfp8TQ+TJB+OJMb0cbxVqVq4K21Hjz7pDV3PqlJtaNIEzxTOveAZyikMFV3i
         BldWwTeClw1Zrpy/7gJYKNwBXh9oy4xQ17OB22xMz3L+D1DRcFqrI+MQ9kAbt++EfMXw
         6DYRR5BNlypqrvA6env13DORLqZJhLL5FoO3a4tM70AUC503ukdAs4456c2xuZyujgsP
         RgSgBRWDpSmqpu0djmLQJbKj/KSnsjyPxv9yIhgZkG9YEh9A7Z62TRi9H2Ij61n17q6a
         utTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810019; x=1794414819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZueyWNpbGIvjsd7Apf22rsrjFkb0XJaz8ncfgP1uRU0=;
        b=ahQ8j2vdC6wMfGO3isPulL8e0ntfX60mXoUB+r3b7oFeV0OgAuQJm1oW1531ZPHqU6
         zqs29yyQq7C5cpcwfelHdSN+MbtJLxTz1yBqQwnygcRGUJJ8O9Q2VYGAOdNOJ7O1tRfn
         ZRKDxY8kHdltqxook+vth7525dWo0mDIXbKpa4qZwDaLyigT1FJhLDd2eQpOj7UNVy58
         rAZKIZqq++KRzDcE04ZaBsOVJlFrwV+j1EpRBsZ6LfB7kJvBHVd0DZJV2Ix1PSXB/U+3
         FAcjXRBu5Zgh57Ptr4+nqzFMFLhc3OvWu5SWgKl5Io/wySrBW7S+iE4MxdycJqv/V74r
         1uDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzk97Fe1oeHrmYwFVplUr365uElYZKwCh07zMt5zU8Fi1+MueHzHGiWKLHu6zq3lqAjZIzuXMahzFsJcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0LMXQPwjnGFiH06Z46QiF32Ut/HMhgYL1TMOEhBRSmey5GnXW
	XgcXFrYw1YIuRGsIGgA7AQ1RvPRDuCg+nP8en9/Ey/7SE6gGZqtmRQsR
X-Gm-Gg: AYBFou3xhmaXPEvKsLWKD7NkYena3vjQpIlo0lXGF1KOooXW0B+m13QG9T+ToNTW4jg
	y/4myGtPRa5nHRbShZ8MzWyu8iMjiZ0PmX429ERj4Fcy9d5mNzVX38uDAVgoYyqzGA7TFr0mcJc
	9iYdKKiDGLt5PIPOseyAs7Q5Plh5zDB0+VUeOVm6VAl/gYeE5AkjKQcXqhhBVk/JwWUrFUlqPbF
	ylnuwA5UjHU04lpzz+c5N6PQhu0J5HTTQqdqw1s/IGEZLhBHhu3Dj5JwzEHUWRj48ORZ7hkiBP0
	HBg6V/bhv44OPWBoRR9uKrea6xUoW86g/a+Xv2WKlR/iGCIEREIX8a7Cz8pG86eeOLz/qShhdIN
	nMjv1aZEku4XWHFF8wfkS5jA/YUkPRNErbo9HAE1fBC0FzRDanY6VafSnPKzqpdmim9sq/SCt8D
	2sSzzm9TL27us3NVAvESmd5BRcreF9wAbI8QNqQ94V8H0dnzWB9eE4PkIzcJX6dwPzunFF7tqkT
	7SBOzDB6dWzpGNlbwHzrGUpALyalpYvdJIycBS+N9Dy2Bf1sRB5RTb26babpkJZHBpN+LvikAGc
	PiX6FwQr0nE3me2PBVP9SzXfSiQIK4rPp5YERxld5cSppyXofkp5rEU=
X-Received: by 2002:a17:903:2ec3:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2eb364025a8mr153213775ad.5.1793810018654;
        Wed, 04 Nov 2026 08:33:38 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0922b86asm9967835ad.76.2026.11.04.08.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:33:38 -0800 (PST)
Date: Thu, 5 Nov 2026 00:33:33 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	justinstitt@google.com, morbo@google.com
Subject: Re: [PATCH] media: siano: Replace strlcat() with snprintf() in
 sms_ir_init()
Message-ID: <hjwpt5mf7bows633pol5hwmz3uxwhl3fhjupsertv3g7j5m7ya@2rmgrywzhjyh>
Mail-Followup-To: Mariia Nikitash <nikitash.mariiaw@gmail.com>, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, morbo@google.com
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>

On Wed, Nov 04, 2026 at 01:02:39AM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1],
> replace the strscpy() and strlcat() calls with a single snprintf()
> call to construct the IR device path.
> 
> Both the source and destination buffers have the same capacity,
> and the return values are unused. This preserves the resulting
> string, including truncation behavior.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Reviewed-by: Shihuang Liu <shlomojune6@gmail.com>
