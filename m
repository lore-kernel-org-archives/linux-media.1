Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832704;
	b=kh+SjrQfhs8UCjF9nhENLWlAfuzV1FuwPdNKTuPiQCGVivu+IUXv9spqE68VPUn2rfeY
	 ZvWaP9aQi4pRHrcsyTyJge+N2l8mXoipmtWMjdtZFaNwCULg7rT4UPkQtCRzKfKpKse6I
	 ekGZZg9vV95IizadRDPfKmyVClzSnRUbY5HkcwBaumRhs/7yipsfuEavNGlJlGH6JWWEs
	 k2LL9mgW0eIHRwA7O23wK7Xrzh8DKQMCu235jUtz6bAHlqCAv54ah1BHjBoAT5wUlCHVn
	 8bqnC7IGWzpWbqPYcFp6yJphc0Zo+gqHvn51LehiubLSXM6gbLtTeIUEc05X40Vy+nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
	b=rI/BiUWVWhxpTVwl9TPHBRk2dOZXrMILnhIpwO3g9PnL3a6J+isPESosH89OrAOfpY33
	 u4M5hnDuiigg38ATCB3ga7uQjVPd5oYb1Xhuw5CnHvJelaFe6oWHWHv9zi0OATpCFj4M0
	 +zkeBLVzsjTiT9Fr+m3mbY6oNNpa3MJGyD5tkjirQB7ULuDbl1RDKaWUbgWquEvLZmD7a
	 mun/EmiA0QZP/xwnc/RGTiaYFWw64s4ATJctEmb5bgNrLki7NI0066iAZ6nsZL9L8gfR7
	 de46VKKYegJmhRdXUlGxa6S0w7kBq6pbjxvovKe3MWBMoIkHIeRN00CNZt6NzXibxYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUM7JVPp;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA9606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27FA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUM7JVPp
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso4512379a12.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832702; x=1795437502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=RUM7JVPpwutEm+7F+zdgJvTtidJzwpNDR78QTOyTKu/Nib9oNtNDJ+Ii0H8bLXRiDu
         6jcfRxs4wy6N7ULvVGFRxaIeCqaYaGkmvauOlvWryvxuVzntlmDQ8IuQ3KNKGwCOohj0
         hxFs5s9EZpSeztkVEOZQPC+DQ8auyp14KbMbUQtRTyBtChIiVepRcn6fbXoO6aCD90Eg
         MW/dcTzPsN3/5XuidKVr2FijMJWAreHkkZuZBOU2A/WX8+qSmwMivQr2vFlyK++enW9L
         Jaru5PwZDpfY2HopFRKT6h4A9wDXkYQqZjluO9H1/L/dVWSUaHa4ZehCLI4b1ctG7WCr
         FIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832702; x=1795437502;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs7ruyFa3AhcPBVXazJxZ8vpDg+GWQjFG2lYecJvOs8=;
        b=Cc6SKf0cTEXhAYN+Dg4YYQppZcrqu6KtgL+z8y3+ZGjgTgLTpcr8YsjajWvWGznc0C
         Yt2yMOxwuVP64FB29CKiObCuIaxpQBllu+UqFOlFWm/NGbsL8JoWEAhwzhpOiz2wj5ga
         UurVbOaYC6C6tB66OsktwWgwte8F4sgKo3rsNIQvPMhPaqpMIj/aGq8gyYg3pzOloN1r
         Mn27jOpjuA45Z9VjhmADNjRseFC9GHPz3NCJRKw1QgMfgUkf3+1qD63UwzhAPwl7O03e
         k0IoLB70VON+ZeAw0WD/eb0DxPt8Zr1hyIJRpjCZv0/8Uzt96AmVoJg4gJ8VMlgmEX4z
         OLcw==
X-Forwarded-Encrypted: i=1; AL+hErFRf8jkyTT44dpNZ+lELQELCRfXhRHBazyn9J51sowgwOUEfDMhCIT9b8lS/CQ/1BTrfVle02Dv3deW1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8P9nLnEFlUD2VoqA491p+pywC37zjuQU1zt8Xv+qFARXjBZqOq
	wnc0WMoejWTtkjADg0te9rGTwkfXJEd/VQV6kTUp+vS8JsWon2v1LLPS
X-Gm-Gg: AYBFou3oprjnNubfIXX+8RaIoRydJu7Q7uLJgUlJIkLnP3ubLEazyxOC1g90JgbsmfX
	EFXMwdtA8ADe0fwWJ3AKBdrF0OT+EoVmfY9aaWqcyXYyCA7MNx47EiCxLl5Ss4fNFoLcqlKSETV
	vmrd2lGh5oTgZAl92CwHl4Tf112jvuvhGxSEPuwzPQErxd8coacSmYyq01q9hsPt9N9VnxWj5+R
	sb2Xr9UbMKXK/q54RaBAnF5OE85O+i/3lJnHU3wVYyePaoKvxQxe18SeOOeAXqZPTQxcgFtrTbB
	Z4HYP9jkTvZ+3r7lK0EVnHoanQQYKrdPsk5XukYkoiGQR2x3eA9DZ4/o7iUXXXWQbN+JcX45BkK
	RvH26KUd/XEZj8CNzJ1P8MMxMdn11YVHaWTgHocYEgzKfvWCnEfSVw/PhTjMi0G8h3K4Gq0iyE/
	Hrn5fZ1IFMYWkd2OwY7jOOgP6wlo2BgBASmjXxohtEdggvSiVtU6PG/yaAPHSDomurkjbdauO3V
	OoRg1Ta6KxxxSIoWI6QERA7ItzlHCNh/ZZK82id3kNKZyndsDzTgGI9Q/LapH3Lhcvn4NGjA3Bv
	biTVIeOKcf1AoGY+27Lq+Vnmj6GQF+M89dwh/59STqbjWnNv8EGYKUR8mDQ8zKJ7tUct0WBwltm
	IoCYgMkX4uiwPsKG5MhtV8ZIPlsuE1CdlCQyyA3sQUN12v8zT8ELfguQWJ9RSzJtuTKCCHaklUa
	AtEBqFvBn4WmRO
X-Received: by 2002:a05:6402:2113:b0:6b5:962e:e00f with SMTP id 4fb4d7f45d1cf-6b7c0c6dbe3mr8755642a12.28.1794832702439;
        Mon, 16 Nov 2026 04:38:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm4600398a12.9.2026.11.16.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:21 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Message-ID: <avr5OsqqZEuOD6vh@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:56PM +0000, Avishek Chaulagain wrote:
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
> @@ -107,7 +107,6 @@ void irq_raise(
>  
>   \return any(VIRQ.channel[irq_ID] != 0)
>   */
> -bool any_virq_signal(void);

This leaves a dangling comment.

regards,
dan carpenter

