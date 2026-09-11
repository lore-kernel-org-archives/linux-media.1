Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BF46982C
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116711; cv=none; b=r+tBrjydWq7FXKVSiV55WP4g0Id4CgpX8Vk5SFj8DvG5R7ObfzKr/A4AsptkNpuvub/PJ6FA7CBGS/Zu3DuLYKNH8kVeGpABD4tSzlGcMhCB3KfbynrYJ2hqE/LlAU6DajG+SfnW3Bsq1kf8ke1LGuhWjtPi6/vG4VHObcUEha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116711; c=relaxed/simple;
	bh=hmoxnYwHQzaQCe4F8Y3CLA8NrxAw25ra2YX4rdQZWwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNqKc9VVUoSR5do2sJVTSQOtlKgk4OgWCmmy9lYVhxGaLL3a+3RpcUpzxP91tnGSvDBg163Fg/lfG0ka8UWVed8B5lRAK+nQmCVWrRrSxatiAJKZvRmKuw138uCmGIPRiAEsrO5xqqqFQjC2ydx1ibdErCI36MYsnyRjax0QQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlTExZ3U; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlTExZ3U"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso423683f8f.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 01:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116708; x=1789721508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmRU1GaF/wMfuP5xgxO3JnXP25/ia3NfUkXx+nJbTrI=;
        b=YlTExZ3Ux/0/8Clcu35FBB3JJk9Mie5lY2GDN7XQAiS12wK1UcMYttLFw6y18V18A9
         KA6KUeRx5v4IzeGnch0kcoQSCwz0sh0gwOHUPbX0vQru0bgoJRYOB1iVFrDtwMmfG3eZ
         alBqIdqJImzxYZWZ4rxwf+ERWKfSIVQmU7FlFuyHsuuJ2Pq+l9YiifO9lLW8ARkX/AvN
         KDAt0whq+09EZ3nVzcBS23Bid0PyBGtGXKtuuHbCmeHLgCuaN/1aBB58zhXkQzZTRJQZ
         D5C2zT/E8zH7tOv8Uyq8A2o8cGWMktAsiY5OMxg5eCgyBEVifWP31/JZNru0aKvm9TSQ
         SHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116708; x=1789721508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmRU1GaF/wMfuP5xgxO3JnXP25/ia3NfUkXx+nJbTrI=;
        b=LwEpeeXeFgPYHYrBZyeqri+529sOFQZT8ntAiqaUO8Es3/XVhrY3jkq77DmW1xv8+c
         Mnx+d7LYrtojfuPQcQXVxEO7ta7HzjPQ0KLIJpOFKh2/briqpUCMmHEPb5Z+BjuyOElI
         JlVN/bSjIzH5/jYulUcmvFnwNyaAVmLyzj85/7d0G8XtJ1+AF5zmRN4wzx8A5acX1DDZ
         1t9e5Wfckd5YvMeX6sUAfMfqu/sDkYnhlC6tIJRI0SUkYaMCcIgUz+KY3rnO+2bhJaUe
         BQAMApuphA5GPsRpiXpg/pk3NTvKrsKadvXLc1y3MFcyM+f99BimlsEGpxfO6h/+gMJV
         vEcg==
X-Forwarded-Encrypted: i=1; AKwUvBwLeYCzmYeflquNgGBWAP67W5MD7CqVGLmeL1iwYFm8BzZ78Om8xPZh9dqgCwL43+7tYQybjWpzI/uevg==@vger.kernel.org
X-Gm-Message-State: AFuF++kRQXucKObKeQYYqvOMr6fmOJ5XblsnYdap8nluxfZPllhSSR30
	ZYh1X8ip2cHipT/DCNELXUILVY1UuY7I9FEexUaRY3iKGqjeGiuJVs6L
X-Gm-Gg: AYBFou3DWiKFuHbG1SpGeeeEgYGewMUByzxTPU3gn2yE4iR/9yF0q+afi20ahGuZA5Y
	KyRZ4QWeHjImCxoD67gxM2aBZcKRPDvez18BdozZMgj4IvLtrkdv6DsuLYm8LWY7ay4yWOeJiEi
	dHp5MIangZKoj03ick0NWLx0ZVulSZ9IgE5Bp3iDoa5uVpU5J/eVcyrEEry/eW3eFA1UdJ5ZwUF
	v8gU2yavA0AnjIi8ccXkgSkFwbRWyblJ0muIDQ63uhbXPjE0LR9lW1dUq6fawclM3bsqEbUchAp
	ii4nL0k/on0hjJWqeUYzNODj99NhvMXF0sO3YE8xzA2PyUaOJe77e1B9iL6rnFP8l/h3iLzCQQl
	N/BnwFnqn+Rg18sW+bS7kh2dgRMO7LS3m11cImveXfuvJGCswKlsqq9aAm+uCHv3iTXxxWa4Vc4
	vWorrrEecK66k+tqxhWDprxyHsjqLSk7Y+2tQPuG91JSgCWyFVkIl/wW2gxeY5/SpgYq0/0vwTC
	/Z7mPm1FRtGN/hhsfMAteV266MsZRyEOc/979NGfHjeccSa234m2jX02SF6Wq3c
X-Received: by 2002:a05:6000:618:b0:485:8c16:a361 with SMTP id ffacd0b85a97d-486eb3713e4mr3488982f8f.57.1789116707683;
        Fri, 11 Sep 2026 01:51:47 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fc02sm4210259f8f.16.2026.09.11.01.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:47 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk@kernel.org,
	linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Subject: Full name to validate the Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Fri, 11 Sep 2026 10:50:15 +0200
Message-ID: <20260911085015.8352-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911081810.66277-1-lsa.uz@pm.me>
References: <20260911081810.66277-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: German Pablo Lindo <germanpapulindez@gmail.com>

Im sorry for any inconvenience i might have caused regarding the tested by flag, im relatively new to this, so any correction on my behaviour/formatting is apreciated.

  Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>


