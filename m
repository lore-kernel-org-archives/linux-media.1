Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C5736F91B
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303249; cv=none; b=dcrdTetKoFigUi6ZTCYP4Ab3NOhVkHHu3hPmw6tOrNcSQ9KQ4B4pVUCKDAXkQWTw3rB2aNO5oTGtqUR34n7OVe1vo38kbzJ7yzbOVMQuYxwnlvHVP5LK2gLrB+C3UQFyn68bGTRNSJshK+rIFkCJzy2kkXNYKqE5so1no0MqZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303249; c=relaxed/simple;
	bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/ZjlhlO6HPhtgZ4WI3KrNj1NGegP8Cb9dbs3i2wdl207KJPuoQAy4YInqloowMo51yG+b3LncpvIyrQg3XpRPth1O3Omd8QchdE/NLg+PZPCwMw9GwXDqQMf2pebLhGqad8ISW2wSGN2jsCh0Fgnzqx+5zZixf5hGQyElp3PNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAPbrvhQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAPbrvhQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso3843105e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303246; x=1784908046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=;
        b=WAPbrvhQhAzsHlL4S13nmpqUNvsoVSfWHynQBcWB/jq+9feDEupm38et2bN+tPUoV5
         wnMtPeqrIsLZ4OJtxufh/EvnmLq6M39BEljVuEXfDMND8CQ+lFsX3aRoqmj0pdnMYvb6
         EmcO7UjvMmK1hgw6BINsz1pkiwcx28VKtAszn2lhs0dK/Wxx3Kpy6X911UDrcjiID90S
         yj28dweSS6Ekr9ufh7QfDqckVCYIntTCfstt6SNtHASfsGqiqbRU1BM1aV9fw5lxG4ls
         OILnohaaOj9mn9nuZWtO6lxVskvUFdIYG1AM5EP15mW6Ho+7GFuhzCu6YhR/lUeL9Uj1
         ZM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303246; x=1784908046;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8cxfayQFlNnwIQkxkgk362Uhlt0jtcBW5Ai1XuO+SqU=;
        b=MerXpbXd6loCmavlHNNNHCurpc65NoiFyH5MtP7yXaWsySgxU8CnPWDYB7CYVtlt99
         nJlYJJuDHnpEBOYH0gN0+1S9xmR1JGL7zAJmMlRvKC5UZbF8ijWp/oxFiMG3jOev4hVd
         1pln6g49UY9JWWiHswkhQruKuO4f+SrI1PYh0X2EluQjvsfflJdiTdORSdc/jcWhlRX4
         zBGeVUHsi2IQjKE+YrvPQUZysurLvvqhYkqM6YbSfoKMHJn6/DnyCQgmw4Y2cSZuemYZ
         N8jMUCcs03yN8JlVY8HJ2BJC+Q8/E3Ou2xCJoLaFpR0pi9tbB+Cf02FnvvrsX2u6aGFl
         26og==
X-Forwarded-Encrypted: i=1; AHgh+RqeYbkYTOHabW1OMM0FrOSMOcT4TveuRgDvThT40kcRESh+h9A9qXv/+kcCHrjnPnwy3ArMKO7+188AIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrjwPWVhpN2yoRx8SuKFVZW/YoJvHl7xzrhy5F1OGjhYhZ+/yZ
	mGB1O/LFeGGkDNWoHYzaBr6eCo9IwoswoLcKFpu95SJ8L5hRrb6sDtw=
X-Gm-Gg: AfdE7cmh7/g1toSGRqqHqpUtsv5HeQQYVaKyQzCM02ivti5JnuqzNJ3atb2vv7AEmzT
	yd9QnWSo0LsY1lw4BubuJdmuUQOuCwjEzenzat+AhwljcB1KLHa5tk6ORzUjAauCFb0erm7yQAs
	W8v4UqcxzqrMXjcmy7n/EyQchfptmZeXJSNF0XUeEMMAccO4eY8M++PkaTfKZPCQfgThGsx5mUH
	bD/75d2ce61PAcDOqdyky+RQCQ+bB21Rp1vrlDvHW7jHcKBdXiIzikE5zGE1REanmjeA2/ZOwiy
	/laJSUEBgmNVTgxYJq+4AJUndyiOBf95YFUl/5YK80OZY1cnIBCpEpBKiTtDEcj3pBTHZpsV5KG
	3Otp736h7YYtJ0W7lNipaPmONqSom6VHeAXtmMUMzHvaaUWh21HDNQLvLj8q6jg8J+Usht9aUmv
	4PJKLxu5CJ8Zv1st8Lx5nJq+d5yROlGROP2rQ7tcuH0uDwvu2460leJv4j7Vlx6S0=
X-Received: by 2002:a05:600c:26d4:b0:495:4075:7dfa with SMTP id 5b1f17b1804b1-4954a51e4abmr20886145e9.35.1784303245457;
        Fri, 17 Jul 2026 08:47:25 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b074csm59211035e9.6.2026.07.17.08.47.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:47:25 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: nicolas.dufresne@collabora.com,
	jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:47:16 +0200
Message-ID: <20260717154716.84346-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6c3081fed130534ac0d5cf83c7658bb13e0bfc7b.camel@collabora.com>
References: <6c3081fed130534ac0d5cf83c7658bb13e0bfc7b.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks, makes sense. Resent as its own thread as v4:
https://lore.kernel.org/linux-media/20260717154505.83935-1-pavone.lawyer@gmail.com/

— Sav
