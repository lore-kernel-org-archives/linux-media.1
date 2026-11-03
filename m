Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710711;
	b=1TAn2dMPGKhEuyWm1Z4hYrBAtjZSU3nw6SZVx3xnGmCsqUyFKukq3RecT7Wmwop1NXEO
	 vwDEPeCK38Tiy+MvVfpikvkor1mUlv6jOFbqk96+Fs8Iv961kVKNARuT2XbaY58StV6NI
	 MIlIbvDzbG6Qpr+G9vzBrcKJPER7AFyhrRPToQzKOlYHivj+rbzrcUdkohCkZZIvCU16n
	 8ZV53xbJ1cDmQwcAP8sF8VFwd0DOIpc64og6f9DQD6J5QLH0fGY/iOOfQw2RIOv0Cw7sZ
	 BIFQtsnmkn3Sye7oJoBP30T6QsM5aCCqywE+VVDqBPYQB2MEKtpUm5N44p3rTiwIcRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
	b=1fNPKmz9BDYyJyX8sfilhEnXBph930FYCeBmZREcHvyMHt92z+hclD22xuhJGGsdxrke
	 XQH69EWaFm7TA1o+aiyWlJNywXl4/UOdYpJo4bBzJPO5EtA77ewXT9J62FxBQGCjto2Rk
	 QKqlY1Gf3zM8rII9JR5LOcoaORiKZeX1O/eiY0JqVtdO5fZYU1F5Bv6H3v1W5//2JqdeH
	 Zc20bDVgaEa4cOSfk5TjHVUu0HcHxP/pCIY4uCfSEXsDwwJ8/a+p/OOlbBANmqvQib1Md
	 dCHV38+iqoCVjERmq5t7dGoNinnoYWpTvXgm83y6+5uRx9jlJBA+td59lYbuJcpUXtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POCUpo87;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB4F606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 12:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB4F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POCUpo87
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so42154045e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710710; x=1794315510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=POCUpo87byv8L1NDetWuu9VNrb6AQX/aqJJPu+apl0almvTmLgT1wColOQB6ZRKt5e
         X9wHqKUyHEDL3yBGrpmojq2YH8GltvroDpAksnkBK5x5RURfEu4je4OtbDYsfpcixyYe
         nCzadW5y8ikdP4ZdB5BhFfGGuaHlbK0bIF+WevBJnJbOPfCAJ0sdNzYx6JYqhYQd3FdZ
         ArO1u70Kn/HOxfLeQnL3PYQIArohc+BJPPlWiZyYBqjlCYaAi0UwAfvRTg/VM2MHLObw
         bJ9Lp9HTj7c/ZFzY6eSNeAHgMN4DxUL7DwpxQvYinyDz0ziPXOec4lHrvhJRjPoK6FS+
         J8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710710; x=1794315510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13BR70RLyJfPpHnpQCP+Zr7de3wwxMOidYdoAlvzUic=;
        b=F6rqaYdmFto5IxjAsEjhSym+QlloAGZF8pVZMkWIN0p0dY7csvvl0bBjOo9YhZWzqC
         Ql6qVVkGU5GxPPxr9UqJdIuAYZe5Hn2xa9AqVCnmsoE89P6ppFfWhhr8o3s/2Koem1Gs
         5UP5yL/Ziu26mCC3dXneLYdiyuTzNLBLn3vezYHAa8wpOFA/e0pAjasjYx2ae0B1+oLZ
         q6RNQIh/+F75Z+jSxonKkb2o28wXK0XKiMavTBAU28cbMwR4yyZ4Z8vk7w9vkxIVSoWX
         7tJO7pA09pxzMN1LfOQYwnfuDpacmNqaNM1E3V5bzbrhvzbM/uUcXdq4KkLN7WnFO79c
         QTGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+VfX2rYu8SV1FAbGofBISr5/1gE/NtY3imrAQCgUiXxK1APQeKmZqQlSrnyxjJQWDPOUYbRhzDGhRgg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+yYplMUBrKA0asrI0WJrGihNNuo161KpC2oXupmWcg2VReCQcy
	8Flc3whWig4NA3Cy0ZQ4BYukKiLctHGuI0JHOhhHl4AjWTFGR2wySzfD
X-Gm-Gg: AYBFou2ttyuTD2bSk+iWqdeOxfTYDHW7NcH1opkkDZJE06y7y7DXkdggPZDHb0qgzM8
	s3pjicVdTYmNuXIcBv7BmEgDwKrwvYhzBlp7UlR7XB55UuxIUbKNKmdQoZa/APvArlTgorhCcyZ
	M/peuEMnWIbD6J1kDAv6CQfp0Cc9zpap75XsVO8PanZ694iC1r79dJpUYdEM9VqwLQ18Njqeh8I
	oB/42M2MDqFm2SEwdPMlUfg/nBiHrLG77QhmHlsR74avpGepb32uWwOWgXmc+oE4Y6mBNsXxTWZ
	QuVStniLMHEoAWXk+JXTE0F62XhYXXhTdt1aIlUpQmqiVDdiHFwD4tPVGNg0Hu5oMsYeE7XNjF3
	Qof2aY2lvEvxXglIO1XJIBxTqMh6InXIbxVpnQ6qgF6PaXl0SWkTuMcdf/xe+RrA+YOA17vCkIJ
	5MvzMyRrAJOeq4miQrCf90pBsDQh7oh08e/lT560LEHZg8lH92osxeDX1zyzNh757wRyQ6K374z
	fEyslG0OW2yEcRMuaLymCQYrX7pzuUTrMX6r2I3GQsytLITNb8sYppplQ48aHWOm6OS0Bf/8hG1
	R3HOF9Bp7eAI1O8xcV86yaJTH35gEj3HHGAHlU91LjtGVKrsZVV5UmYHLlPwWmV3Bno9SISlaTC
	K4gatkZSCWSLjM1by5+aF15zJSovuMacAhOrjsJaus7UVZchtBAPmuv5ilu+HFPx1/A==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr296749285e9.26.1793710709724;
        Tue, 03 Nov 2026 04:58:29 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm223581045e9.0.2026.11.03.04.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:58:28 -0800 (PST)
Date: Tue, 3 Nov 2026 15:58:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: reject short _DSM packages
Message-ID: <aunacczneVpPd3mM@stanley.mountain>
References: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
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
In-Reply-To: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>

On Tue, Nov 03, 2026 at 07:41:21PM +0800, Kang Chen wrote:
> gmin_get_config_dsm_var() walks the package returned by the atomisp
> _DSM function, but it does not reject packages with fewer than two
> elements.  count is unsigned, so an empty package makes count - 1
> evaluate to UINT_MAX and the loop walks far past the end of the
> elements array, reading unrelated memory.
> 
> Require at least two elements before scanning the key/value pairs.
> 
> Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
> Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
> ---

Surely, the infromation from ACPI is trusted?

regards,
dan carpenter

