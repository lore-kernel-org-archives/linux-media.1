Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D423936E460
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301030; cv=pass; b=ebBsyMtWytT1XiVLeLLkhFQg8e6MR1xSY4O2eHafmi1WBiCdgAGIB6TeMuQ8UioUp/KkPJjb8RKHON6NonZgDZIfnmBsOGKpeWlsp5wW9IlaZ5L93FVFhBdjp0bHWuT0ZHbcFmjzlh9ItWKYEHR6Tx5rgeyhWm6CERgwSS4mm14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301030; c=relaxed/simple;
	bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWmX4hv61fXLTQLvQfQ3uZVhP4gfgcaiyrzO5tNcPLxC2RnK0icUxVlErKjb01rQ1AVWTthazqEhUaQJHYTx5eiyt/o9KE1kfNMbIKXFFtKLdwq+RWXGX+CBczb+HdOVGWZiYE5Mh53b6WMYANlWX8szBQMSsNX7Rq2wnx3cjPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUgD14GK; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUgD14GK"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b1b233ca8dso188807eaf.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 15:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301028; cv=none;
        d=google.com; s=arc-20260327;
        b=Df2zpToXg6ZrCZe5AAkDYaeazCy4bHvFRH4Q2Jo/3UUgsBwuBGXuZZYAR18Qh1P+P/
         dYj3jyeZaa8i1iVKwBhynSpXHXE2hVZT/9iNnErpKVoMOoIF/I2LQSNKhe3hXqTsbBKQ
         oBNyV57+ItFkVjhKs4azvTMvna//1Tb+WtzRJmPvPEH9RdC3GrbAIgufJaIu272uADVA
         DnDWw1EUvBH2/ZJmfPHivYaku/telIO+bunhNbX1+vrPyykvuSFtCq6Np8rcQD9R88ad
         wArGnOkU75sIE1wwFndhYPZ9ISu4rpqmudwkpVs2BcjmQf6ZhM+4aVLjQ0DDOAb6NcTw
         /L3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        fh=AM+6TfoWzt5KmDDyATUqJC0Y0qVR2fVQaBtrgy1ItOg=;
        b=dgvW8KEjGKugYR6xzc2XU85A+nFX3lpmaQJfaCQ/hnmSiVoXlpCMQLeNiBYkfQBTLv
         DWxDd7DKSNk1tisfZ0Wy6KxkGA0GwMkAOlnLo1NWwju1L1LPON+9NHpcQ8F543mlgKUm
         DDWOnrrHyT6Pcp/pycf5qPMlaY7hBQeoUfFKyCv02F+BBq0g1kjJueHz1L/0/SHlUysL
         GZSOZuzKgjPhbj8KkQA7T+y//iCV2xDJ9LCByfqV+dZo41QBbkHPgrZTHwN+PtQocKPi
         jtYhyiOeYom7BTt993qqR+IrOsdEacbpA3omc4+9aAJoXae/3X893CrXPIwqMFEqXMsQ
         fAXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301028; x=1788905828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=qUgD14GKtLsjimdLEvXiyKMG8CZoDQhYRbZYxSVLxSjpNakmhC2TZQV0Ksq8mgEFHs
         mYFSFOVOI2VfEyhZxTetrqZ94n0akBbIHawKPEmHd0vfMUlcDwUs0NJLQXbcnZMHSGyr
         RiKjgr9utfvSG3lyY7WGVH0GtHTtpKNAnXWXLljikIn41BrnhClY4Tx/Ha5RUgWQiOIS
         SWrA5NGmvOtlcp/k9v7mpRtSTKP2Cmw+VR3u1nGfkoZqHUm37YIgJKJswCR1GROsdFMQ
         nvKPdgf8JvtPaFqv9aB0T8De289TiwxUnEd/YWcQrMhH794yqGq8YJcfoadtVJZq6vsn
         88lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301028; x=1788905828;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=XHQYto0VNBfb3FoCTCVy4SJ7jyfHEP/C3ZmIAnowQteW6E+6L9UFn5OeEY/0ICJJHf
         k88jNwcis/gINAJuWSULedAw1HxM5JxGoM0WUQkO5Ytg28JAzH+Gn7/AsDXFvPhxZSje
         nUHD9f75fQa0dE6QaITE2T+IowJRd38gOrg2+sucgQzF7FEpt0F7TeIFJh57QycEB456
         mECyrPustTE3GtlE8pessJrqE0DEjF9y6dqAcJd9/jmJ5Ifdfe13dIwvefv4esK5nwTM
         wAe4XVNtRpuW6h9VB/mt5JazhEsdw2PIUS9JLkelR1MyPmGCHiQmwkB9kuW+c7iPqCNO
         bKzw==
X-Forwarded-Encrypted: i=1; AHgh+RqEC4sTc/PMlhaCpLMXPaxJRsFfDjMiVzqOJMwBCoPRzDVrH+3XFieouppub9qycTSS4YXeTyyuI8M9KQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kYJKR2mGIjo05A2qcpkuGveCziqvFzO5cJvHRbqE6e7QiBxr7S
	rSP8JWltjtGTEO7H20RFkejufwHS75JiF7K8TKhj4JdmS2JDKTImh3MFpPHFS4BjNgfRawheP9E
	GQfOMUBMK6dIIgGrZGW8jcnd+80NO/x04bkT6zzspZg==
X-Gm-Gg: AR+sD12fSR7o23DwsKmZonpXHPdTgViitjqhByFdvTejy3w4yzJlNfdeDnOBF+ZAN5J
	khbh8DxbkUiK5SNhRkRCkcgAD0fnNHyhcIzz/GgmRa3Gd7sJfVCeiqP7z9cfXC/6cLZAzKT8/+T
	ZhkFsTPYPNmL66sd6tFmvC/AdxgT5TKycsWQJqe7vGKQ6XkqUZ1uYi5pjnWf07K4naXA6tCeaRj
	SQNV1ZEnQMAXyzogkqUh6sKn/qgugH1FHdSXvNciFFqbLm3twttMqI/xW90VCxg4bYu71Ty26k/
	F4XQw1da0Vmvmd85xrq63G/cyPZ1H1c/veBJdCnI8ms9Ki2dK+/+eiKqvF64RSgwTC5R8VoVeTl
	AhV/Y81v9q1/HyK95jQrNkDTNu2eZxLKYfQ==
X-Received: by 2002:a05:6820:81f:b0:6b1:c841:f8e1 with SMTP id
 006d021491bc7-6b47f821075mr33519eaf.14.1788301027765; Tue, 01 Sep 2026
 15:17:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:17:07 -0700
X-Gm-Features: AcwNN1WBWcn3HnRXXLiiP_T9xHyJKMVOYheIUX-IeYxc7McY8SDCUBfJPf_I32s
Message-ID: <CAO7O_xhD+i6X3YSOPHB9NQUBpfmvg-2JAVojkzVO7Zstnu8cHA@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

The review was posted at:
https://lore.kernel.org/linux-media/apa0cOz4aXZrtHmC@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
