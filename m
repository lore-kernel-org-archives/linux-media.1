Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC1468C36
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 17:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555335; cv=none; b=Et2lKYqItud79cBMzXAj04sClRj0JUqy7TD6WKgKpreIByLE+cgb5NJLflQs3QXyISKToRLRfontws1WKrFHVxSkvlT0xJkn9vqqQd1d0BPpV69MYGUEOeENpq11OhH16LNDo/PGOPD4LSPIPoNRAGst2DL9KgUOhtDiSLuLSA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555335; c=relaxed/simple;
	bh=iAjiUruRuAVx8qNLoqOKBWWu8fPaEQjGNcE0vQje1Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6914OFL9O4YScu4KgJGhHZJq9zSF2irrWpyieO073TG+sC7in1JglBhmE3Es60lfl6Vub8MLeKCllMzbG+pKsHppLplLNfWT59cmWVgYHB3QDR//iXlmvRTXGeu61zyVoQDilwwHOgm/Q+U76j1bQgoUNdysuPmDttcL4k0sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGGSmqpt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGGSmqpt"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1327360e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 10:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786555332; x=1787160132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MCUqo5JqauaiHNYpzgNgbeOUol/3jZeeaOvrFXvZ3W4=;
        b=iGGSmqptVVo0DZHGpgs5cyFSaamiN6HpKOW2DF/S3v/fSX6eNU2l2rnw5TBJR2/uPB
         ZsCzhoDj2/BbstS+yyAsPPbiaeCovCI3vPN5a8xvStxkxwpdna0jw3MV8T0LfUVNwDSv
         3J8cQxbSVDBFNTPwWZdNNFRDvckn3wnIugX0Jb6dzDKsLUrV2uMqLvYQ8IZuJM3EeECz
         DUQr+kAxmNy0OPK3/aGeW4/nBf8XYvIDRpyyaztVzWCzmXpMB5HEslDIUJl/MZC8CMgN
         wTErRmw/GuF9BkqW62lQg57dlbpSeRGdyoAjkfPbyryWhvCcE3tGXk+cA8wN8p+XBhA7
         VlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555332; x=1787160132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCUqo5JqauaiHNYpzgNgbeOUol/3jZeeaOvrFXvZ3W4=;
        b=mc0DBwKAj/XJ/qTkd0ohSXTgS+ENS2ON2u3XXg4/xcgQ95hl0vgHl747uYXXE30XM4
         IjwOklrFGkwCZlkFWagjYgIAG2FI7/ilGKF7hDsdRr2dC31FOu40QGMiQS9MeKF/CSrF
         JJAnsUlW7520/ccemvgbBQRSvuimn+2nw43kQz1u1anEpmDK5UC5EUGS8C/Q2M+ox0bo
         Go1mga43M+w8pRW8H1iEgSkPtNJmu5FX+5jvFcLBwk3yx63MIUe/L6MlDvNyPlT2wVIA
         4Ysdw8FM8sXEb2hqRzxXuNQuTd2CU/kLr/NE+VGplxKxed8KELAorr7K8jlOO1q5moTG
         uNgg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+twweeeiwnD3XMEU/C2HwBWfvXzdxRNTNclktplP7fDbDRk55OSBUnImT4cLJRpBvfindlnOYkZfzuA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4AI4G8k36nv7WsriT/1ITZKE4kJ7rCEi3BbsPkUZRxjBIIiRQ
	Vd8LspNo8B5iKrsCYdW2DmdO7+L5lFqYcDJCJhryoPfcBELSfmDGaIpD
X-Gm-Gg: AR+sD11QRNji7Cn0RmbHF9m8sY9SjQ8kELwHgOWP6e50raL3Durx7aX8k6Zu4xfSTBR
	btqTTPx/F5fMiqN54C3w1NkJ/PineN3rGJvnrRVtF3SGkZAYFDo1PKOZLLU/r4+DphAly9POe2L
	eVwXecd6mBuVTrRaE57efJ1noXFFE0n0aCppjSUyS2xpoY7WUc4EbpzoAMAoPrRYWVSmfGaaEqO
	UwNs308AwzG5r2x9rpuKiLmnuJQkmLP6ItIGtZJoEVqtrdAkiG7PS+HvWhofxky03T7aMK+i01w
	PW74d7se9Tx3NVRT8OmlJiNeh1FIhyv1sv/Al7+MAvqs25uCje00Brx54JXSjtiOFxainR31CRw
	mSmPgN0KJpDqeAwkcJJaKKw5N5tR1pjcAB+zh8EpI2Efg21YMMeYq5l0+JagIyTwVggnvO1+Ov6
	SxMZnGLFE0Pll8MGKUTrkuunGDB+U1IpkIU326hfWSqV0t/ILs09G45DVpFcw=
X-Received: by 2002:a05:6512:3b8a:b0:5b2:9238:5c36 with SMTP id 2adb3069b0e04-5b44e31ed71mr1053748e87.27.1786555331412;
        Wed, 12 Aug 2026 10:22:11 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfb244esm643620e87.13.2026.08.12.10.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 10:22:11 -0700 (PDT)
Date: Wed, 12 Aug 2026 20:22:07 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: media: atomisp: remove
 include/hmm/hmm_common.h file
Message-ID: <anyrvyBMNMcF6Y8F@archlinux>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-5-nikolayof23@gmail.com>
 <anwnHooR7vBvrNIc@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anwnHooR7vBvrNIc@ashevche-desk.local>

On Wed, Aug 12, 2026 at 10:56:14AM +0300, Andy Shevchenko wrote:
> On Thu, Jul 23, 2026 at 09:51:21PM +0300, Nikolay Kulikov wrote:
> > Replace the last used macro with a conditional expression and remove
> > this header file, as it no longer contains any code that is being used.
> 
> Split this to two patches: replace (in the similar way how previous patches
> are done) & remove leftovers (file and no more needed includes).
> 
> The code wise LGTM, I will give a tag to these patches when they appear in v3
> of the series.

Hi Andy, thanks for the detailed review of this and the other patchs.
I'll fix them and send v3.


Thanks,
Nikolay
