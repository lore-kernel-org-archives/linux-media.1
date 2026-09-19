Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C974368D40
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 05:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795955; cv=none; b=Yb307/iPCaODnQAxt8SUKfAx9b63rePilRd6V/M0kZcj3vPqVvCz1Bxn1sETbXLf1EsJ+ey/C5ENhmHsORhT5aWrig5mk29p2nkx848wjrBEYppE6vu24k5bZV69vrGnGHGZo7OjCV81is1pjPJURe5zGG/RfBLel+rfbrywDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795955; c=relaxed/simple;
	bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JgN6KWRlsl7iMjk6fPMiCeERROMXn3zmVxozIn4KjUEmCePlS+VHriLDQ1MkzP8ZB6nttnS9jCzUHQ06UjeikTUht6+cna5k96VqCj38O3H2xCFASwD5WAcwZ01FMU5HZ7PAddb9u8vkTHVIkUuqkrcg4wDb8Jo+g5jlgNl78/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPeXe53u; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPeXe53u"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so18923945e9.1
        for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795952; x=1790400752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
        b=JPeXe53uo9G+uAj2RQGc2oGkSUmoP5E4RvydCiqXTpgEZ39zTtYDeHt8LzdQpNUjPu
         MEBX3MeIeTZk3ihePLJZdmdDsGmRRly7nIaD9QJtD98CpReLfJSqK05E4inmeNLeQpsz
         +gZsp91vfn2ceCWoCvUlWu9ZfKcFlngGmiT1WLGlt5YD0TUlY/eHhrqKDyQSvfFQPEC8
         whge6LPjMDvRlcBRIJ82UXcpzeN63MpSI5wf0RQjZ1SJxNkbB92a4dVXaIpwTSL1gYIy
         pBp4Ra1RzioxpPfXJrp79hj3ScXJmsXQXbvo0kmcpeJJOOik/I9MbyuC2Jp3ADoXu71k
         04Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795952; x=1790400752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7Vrqhz4zZTyEAjiYZc5R2ZjTYR1ZaAGalKcjp8AZGQ=;
        b=FF+pCrRpsbTh9vnFfScSDeEz70a4QC8h3do0cYqO0NS4LAn5Br1agf7nw/sHjYmx0l
         KhSz68mYTXwW/MrKGnianguXEq/ojaJNYsOjF+Jf1UoRp0ClmHBgZDCoH0IVTgLUQPFo
         k77XYvBd6ARnHdllfe+7bRN+PvLod6MaIhplI4pGy+ZpCd0AvNRrUPXHd7wjX6V6M2Xt
         Z0lARG735+iAHnsV2Gik9d2NhQ3yS+RGIxgg9ai8uz920N6qqvkTQxzThf0+51IYcDZK
         3HC7E8s5eHhKA2IoFRIeMvsCNd7Q5YoZHHoTJ+vrhdqLkt1252G3hYcdAmZ3uXkj3WK7
         Yp9w==
X-Forwarded-Encrypted: i=1; AKwUvByQ58lwSPKYCZmW7nLlmD2R/WSSZEF5Y7otjAgeINvwcv/lMaTfjqP33iKGqJvdNil/FT738wZ2/+MhGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mZJeaCgxAnOYUIis4IOiXhLLAS5Grpt/SEA6VHwKpAqY+AsbwR
	6hkdc/TlYZpK15+8mjlX1Ijke+PEYx4rGMxGpad3D+ZVbzBqMiLKvFoM
X-Gm-Gg: AYBFou0tFSNGdU5vIadpo5UdpUV4rk985KIveSTet/U6v+ZYO6+5STFdk/86BSyxOD+
	3d7FuvrgepoG3wPuTbmbMLZrGff9zZq5L6Vzv7UPKFr8hA9K2Unqh23sn4e8qya068Jhw/18tKl
	xR1Y445iXYU76dHSWayBsVFwMQlMw9+HCXb+dTAjZksTsqzr67fhct5uQahmIaSGd4VwaKJGpYA
	7Tk++3+h+U4W3KoZGibkE5yOwk/PFz8YjiJKbZ6qlAXmW/mU/5xXEwltDTJESewsM78QwInoksy
	K+Um1snliIgCCQuheL+MRZgvosFOaSI9oj5d7VXCuGbytywSwog04aXK/tEwmkPVpiXjbCGeVJo
	NdFDTnkQCA+81LYjS4TVNYjZ99OV3PFwnSNDTC2CBkaKOaglbuTPvUy9AQQICphL4w2vDN5aQWD
	2d7VeFHNL421ip/+Mc4H08qMvqWLFDDqQNNGJooN6OBiN1l59P/nKOAs7GH8yY+XCQCia3NV8Eh
	ASSEZi7ukTHKvfhg7KibVswlpuv0LFp21h1tqjkDlnyipCjRcZEfBu+LOuAgiCgAC2VWcR5xShI
	M4DNVsmC60t8x02gO7fKmH3FKkr3zCB+GGWbelv9KZTpk6+4W9SgxYVx/EOtPtmrxymHs0XfvC0
	nrhfQAr3owBm+sAq1
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr61632675e9.5.1789795952410;
        Fri, 18 Sep 2026 22:32:32 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd2f7ef3sm40674185e9.0.2026.09.18.22.32.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:32:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: docs: fimc: Update module build options
Date: Sat, 19 Sep 2026 07:32:30 +0200
Message-Id: <20260919053230.26339-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822090647.98016-1-kmehltretter@gmail.com>
References: <20260822090647.98016-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 11:06:47 +0200, I wrote:
> s5p-csis.ko has always been controlled separately by
> VIDEO_S5P_MIPI_CSIS, so building FIMC as a module does not produce
> both modules. Describe each module with its own option.

Friendly ping on this documentation fix. Is anything else needed
from my side?

Thanks,
Karl
