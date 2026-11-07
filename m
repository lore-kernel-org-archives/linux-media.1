Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047338;
	b=SW/4rphZzE0LBEwuxqoehEIMwlxhR82ZqiZJ4AQhypaaA0CxaLsbQykh+H43GdWQFAs5
	 9mX/gfpvTO8hW0PtDrwzAaY91gGHLFZ1k2Cdx/yG+7ak5OQFP1ReXMhDnx5Bilsm97Cq4
	 NFuSDOTEjxRJ3C0J0sloDPkBs4PxtFjVAOPUBxrA8EzssZucE4SzEJ2nFbX/bAAGpMWJa
	 4r9vUnsNuDBHe79F53kYGosko0B19240Qx3MC88yLGUgP6a5JPFqS6zS7ujIk76j84sic
	 Jeq4UUgsp+gIy1GaN3CZ25CzUpQJenhHa7dwnEQGsevo5FJx1KRHwEscDstoBp/dgsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
	b=fpWDq4kEeHTL9JeSPesx3Hf/t932+jgpWZgSm/Ugz82GLLrFYly7u0Qyoh+4ElGtufLC
	 Fz9BOTVOTu7XmMFRhCMcRAdNmshJOBDsGTldggO889f8R+g6vVSUnwEQpEDMYBncLVrT4
	 HY9GFLe2FAXdK8XC2zVhqNVQnToFEmfdBiQDaff53Wxto9aXwRqFqXtk50imy53zvI2TJ
	 9Z6EQyck2tF20ffJujWjC3vCmtFY7oFE562+9fLN0aiMstqIBtQnq6X4HOVYyfgQmGht0
	 FFILhfirqFWNOXEKp1ldes7BxluX6n8Zt1PkPCcUUtKJbarnG6nODr3RiFWqPJa31kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIHyWpZ1;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671C606A333
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E671C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIHyWpZ1
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so7013305ad.0
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794047337; x=1794652137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
        b=gIHyWpZ1iCEkEzw77nsaKu/5dokLtbxu79KQ+4oc/nYu8jWV75d5EiMPwS0C4oqg7O
         8eQlPtY/D/CRIUpPxdPOcZZ0uvYR2mBJn6JFFVp4GAh68bMGBOJpHsmg6FwGybOLfs5P
         0Lj81vleMhWg3IHz9caCFulGFeHdC1rKvTJXfuWE58b8cIutX1RCtjEPK/wg/8kgP4ls
         08vzh9Aw3v7vPYNZ0tZS9f5eMDwjIjaHZwcKmGwycUYTk1clSKRnon9fxV3hZIxiToXC
         UX8Zn3VE6sy3ANhVHnQ/ZYNeHU6PS37NUfPQYSetckrutcMHO7CUsNhn+TEMfP9ETP+f
         +1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794047337; x=1794652137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dSc8Cce0DahS+PknmXkz4T5pIyv2lKURzT17LCtrd6A=;
        b=Xq+jqWKFiCKxsq69cm5UrUbl6GKD5gs68AWc+GuqA2UKpViW5hKU8XE8p9Lss70xgE
         CEjxOPA1Zllx/YpmxYCUCFyFfqOL0zuDMOsoTVPCNa/qb9x0a+ACaV2CyNJZ/UJAp+EX
         +wxcfFWradqRU/Aa+zSeWdj0wG6jH/gsLj+0OMgZoqH3IiP1lbVO/ffQIU4Y531xU4im
         NpiVYmPsldGtwI+0JL6oJg3qT1fhy4PhRlBkkmFQDUF8p/sviLvMA4lh7D0vbVnb3RX2
         9Tc5z4A0yLzf7oT/nB2ulrwFHsrBZbe3ueI2d0IJQOHfaLugnyN9/si3oRM9KuPUCvwA
         V9XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPPByVUnlREGP5f6eRusIm94WvI5xdGFsClk9hyc+IIAvenUiVkWeY8kmsbSzYDZ2b0nGismsfruQDjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ERjHDxP1HaNBOx+eEbOax4sNmwH1cMhrHKPL3FoO3JEBbbH5Z
	KirC6qmFiEq/7ZrnSavSa7euMA1zaHv5ZgG7KzQwJoUD5ZQPT/v43Fcw
X-Gm-Gg: AYBFou2D6lCC0QGeQjb1mjf6NRZybBYjNDqSAqf69kaEeqaeDlEMwteeS+QfPGQCpnC
	rSUmwOcijjh8nXnYHKhIwAXuVb9iMO+4xAMEft91VLnElJVK9FmE9IEhv4Xi8s1/Z+TFi5hqSPs
	qKo2leg15Lw4/74Il1KbDUqPz/D4ThZo/Zbb5hUhRkT0PKjwq+Cprp+fCGZkkPadmA4nNZ0ADQT
	E53gy4QPu/tVb8GP0lQYOjI+fN+ta01HaxuREHmq3WmopM9u0v4QjDJF3dEi56bxcEhdsHuDSSa
	XGCN0aqdW1c8uRSx7x0IZ0gY2LFJcD3X3cNceN9obZTLDTP8hdHgy1Pz6kX/2kWyOGlFBfTOSNE
	6tkzj5FSym8rfYdM6lmIaaNoKuPiOa2TwSzP8Bpe9rDkuYadPpc7nlcKNU5tfprYRwrKGlbOOo1
	SUdtAP/cyi6iQG/1uo2HA5JvVDDW0P7cOEMAcZdwfqDYY0fT2qZUzvUwhkZJWgALV3Bk1g8XJT/
	O4OFpfUoUZMxwG2rJ8eWSmWmbNYOuQdnG2zEdKzK0ZvionK8UJBhtGBbXy1e1e8zuoO62LbvS9d
	vEhC80G3rbkwVwHNc6PYCvqdt73Mn2ZkezJHV6ZYEpWDGasZG9FHfq4=
X-Received: by 2002:a05:6a20:939b:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-3ebb2751c28mr5214585637.8.1794047336992;
        Sat, 07 Nov 2026 02:28:56 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b58293f83csm122073b3a.51.2026.11.07.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:28:55 -0800 (PST)
Date: Sat, 7 Nov 2026 18:28:45 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Mariia Nikitash <nikitash.mariiaw@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, kees@kernel.org, 
	justinstitt@google.com, morbo@google.com, alx@kernel.org
Subject: Re: [PATCH v4] media: siano: Replace strlcat() with scnprintf() in
 sms_ir_init()
Message-ID: <6nxioe2si6ch2vbdfm2sfspwckbp6qp44rgxztnioty3smqxs5@eccx2xwdy3cy>
Mail-Followup-To: Mariia Nikitash <nikitash.mariiaw@gmail.com>, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, justinstitt@google.com, morbo@google.com, 
	alx@kernel.org
References: <20261104090239.311074-1-nikitash.mariiaw@gmail.com>
 <20261107033928.13891-1-nikitash.mariiaw@gmail.com>
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
In-Reply-To: <20261107033928.13891-1-nikitash.mariiaw@gmail.com>

On Fri, Nov 06, 2026 at 07:39:28PM -0800, Mariia Nikitash wrote:
> In preparation for removing the deprecated strlcat() API[1], replace
> the strscpy() and strlcat() calls with a single bounded scnprintf()
> call to construct the IR device path.
> 
> This preserves the original NUL-terminated output, including partial
> or omitted "/ir0" suffixes when the 32-byte buffer is too small.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>

Tested-by: Shihuang Liu <shlomojune6@gmail.com>
