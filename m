Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636055;
	b=RxRkhbnRzJm9jDQVKaSGsgGpFuLBfWdButY/eqjwLBVqryiUwhzkVmztRm6g4CkwuJlE
	 NAqegN53eC0yZK4rQaXsa1/42l2Vbn/1RjhUHvYy74SCY9E869q6M6JK4+iV2TSM0PIzI
	 TVySFDtX5xjtH8MIujTb1qucjDZxHHJmVth8+chSuxwToc6XRlqEhRyoIGho2dRhMlh91
	 JffEuYQSRlFzj/eocSRGj+Aug/3gGo6oSEC6EMzxtG504ToM04UQMvggV4V/FuiE5beYR
	 a9X6r/aMwXUVi3FkicgPUliY4cbsAy/ofH2Z8zbit+OLJDbsg4kVlnUdG5ruuYwpfwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
	b=g1KVGhlrQiR4Vj24SMliRAXDwfQWkdYPN09qexzh4mAj7pWqLJtU1Dae5MRCkHg4EGQS
	 FzSEyLof/4tNG/NBn0vJSta9sX/4EbIV3C8WX1XktizSfi6WJozE2UVSt3HjvyQz44XuY
	 5zkW8oSP2BVJfGN7RzomXS4bFjrEMs51hb31y0s05k8Lx+SWQ6JwuFUHrzFJTNsIEWLIc
	 +s30k8mipLtBy9gXS/l+EUoUAJjJi/wTKWEYhQJ9LfOBbCCVPPsbZ1nCeR9cGmT2S4lMr
	 5hwD5VXZXrR3JlWSS4UzVnOEqFKxaI6CNamLP30JHFUSlpV05MsKqAQcLSNll+lLw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKyKp0qs;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DE606A31E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 19:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0DE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKyKp0qs
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aa9606ddadso4050838eaf.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 11:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636054; x=1796240854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
        b=TKyKp0qslwB4z3SvhO4t2bcXRwL3CbBD4oIxzuOdwOA3zSwh6laUJbsIJiqpFPtBsO
         E2gkpHjapAYrqOU/QAvG/sHwHufNeA0D4KHGjBeaIxTr7r5WC7KPNn9fQLaOALX2YpUI
         QvMpBxm5VZuLfOH9WZldV2+mYW0kltM+0PowVuLeCNpCuUNb+mDT2Xkm7xWGgQWwg38E
         felaFX+EdWPXdC6zmnqsAec1WHvBPc0rw9vpHZsiZr4CtYz3hzMZnvuHYzFNERA7qphS
         9QmC8zFpC2uEMTpqh4S+UBOsYHK4TYDUAHKnrmfvsFkNN732ehxvYmgPGHpA+OzaaIGo
         CxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636054; x=1796240854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=grrU0uEFit9XRwVTApcRlB5D+yBJZUkCWHnay5I3nKM=;
        b=zTk5l01wjjsgGFvB+7hvBIsEDbE8oAAborMKO8f7MGYwUC7l4oxaE/7dngooadbXms
         760MWNNmZl0Ih4JgDAigv3hGxhTUJpGoa3iuR91hOmuAiBkWQjWGOdWw378bR0vGyGW7
         9Q9vsmN8jq8LeGm7RE3LxIUU9ZcrmQbeO4NZuvZQdSRGpMxHzAJbaa21VCW42qK5uyne
         uEs7QopJNMFhRgtgi+gh2e7k1Km+S4/w9WTnQu/ZTEYGOkoXX+Nq/8qHzhtc7RCtajTA
         oEKSIfjElf++o3TxTi7hn9AdQ+pAj04K6Yo4IwnnoTV5Y0R9AwJ351zvs9x0GVnORPtB
         aCMQ==
X-Gm-Message-State: APuU4Z8zgrgcTa1aW5AmL//uPdlu2nJXROtyxlggBfVsw+GYX8rUtb91
	1xMhBeyNyuOM+lftit5CZWa9YOxgHFK9H8oDQJD3DKiKCO0As8hDhHQ=
X-Gm-Gg: AZFdTZevuMZegPrxbjkv17MftXSC51F6afYOZXdhJUL8wrylceO3EPuSOqTNfL6G0l/
	9nGsOtDD8rjx/tnbRZe6+z0jApVBynfjcYFUbAAQU6cPOfYOz2T8l7ZYLVkxueHDipeY3t1l6gA
	HMa7nQOlVPYA0GYJaUYOQn+9uIxNsmh6T9U8zPUDe57C9X4ni7xhpfElx2n3uKUOA+apD2dmraZ
	sevHxVGZeZ4JAJ9opYqFYcx1875VzzgIOypP1AqwEr5seUpyTYdIFKjw07W15fssl3EGcJ5EbjE
	UXjeUwGBe0iavVCVpMTeRg7JX8OBxTlu7Kf+HGbsNgbQU7pEfgKr/zGro/RPPuCl6ZAN5QkxPvk
	f0i31eyV0JpHDfc3Uysu+0axQ0Ndx18IxzDpY3H1va4eH/o4C3Pcy4jvTC5sRT1Bb2tiDyX4iYi
	7RhFui7yioh37UGOkhQrxbDsByQXx2wYg1UBDg52TnJS3ZChtSQdfcv886j4PAyQ6S7psdDcJIr
	RytLn9DcQ7gb1EZTetrEDYxAlGE4n1xRAEFeDuqO60Q37SInxipEbJBCfmK2/Ns06sJFQZtKJ5i
	DcexYoRmJcJzwf3FprDJ5bJ8FIT8r49DNtoX9SbyDlA4jezLotM=
X-Received: by 2002:a05:6820:c7d3:b0:717:163:aeac with SMTP id 006d021491bc7-71b39563bbemr12689828eaf.68.1795636054231;
        Wed, 25 Nov 2026 11:47:34 -0800 (PST)
Received: from miso ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b8345e1f1sm1121467eaf.5.2026.11.25.11.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:47:33 -0800 (PST)
Date: Wed, 25 Nov 2026 13:47:32 -0600
From: Matthew Laux <matthew.laux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 10/12] media: tw9900: add S-Video input and
 progressive source detection
Message-ID: <awc7VK8eOleuJwKW@miso>
References: <20261121035523.26764-11-matthew.laux@gmail.com>
 <5ff7af23-de12-40cc-a8a9-29d787873837@web.de>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ff7af23-de12-40cc-a8a9-29d787873837@web.de>

On Wed, Nov 25, 2026 at 03:38:01PM +0100, Markus Elfring wrote:
> > +	mutex_lock(&tw9900->mutex);
> > +	ret = tw9900_apply_input(tw9900);
> > +	mutex_unlock(&tw9900->mutex);

> Under which circumstances would you become interested to apply a macro call
> like “scoped_guard(mutex, &tw9900->mutex)”?
> https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/cleanup.h#L325-L328

This is a nice feature - fixed in v8.

Thanks,
Matthew

> 
> Regards,
> Markus


