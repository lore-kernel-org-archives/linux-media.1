Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25F30C152
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784966451; cv=pass; b=vBd09uoP6tW1nETzDzWZxY3NIEAxEw1Q90qm1efgdP1taOlmgy0P1V7cTZ+l7j4wCMd0zxxQ6xyO/N6NmT/5GFUxS8aKEGT40zFSCtADMihp4NLMAtY7Py23yBrGETMlkvyA1+3g9o0sLlxKreoKO9h61Aj8+vLzvntf9Fa1dL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784966451; c=relaxed/simple;
	bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1pDhwg5aWLqBmZJkatWF+9BxLytEXIKJogUozrDx3npSlfVNY14ts5fOlyXGzo2G0K868qLYEjjbf0apah0CyHYWvsL1TnjKz/4/AzOnBgSRjIiyJ1SKZVn9lfmKL6MuEoR0LYZ6O0mpzfCRrZA6a4ckL3j0paTauqlAi78kU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOWROuB5; arc=pass smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOWROuB5"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e50979c71so132681285a.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 01:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784966449; cv=none;
        d=google.com; s=arc-20260327;
        b=FdA52rsqaMCs0TEaxtRR5+a9Ki/XU4Nh2f0FkO30opMmOcnATMNIdZTIVBJSt7sYJ9
         xSbYmpboQa7ZKZETH4wF4HCuZhszj/k6QdGGc/uuduMCGuYh1D0m6t+22QaeKkfpH0Ah
         gI01Pah02Tkpl8VgJEa/EYtQdqGo7xu6RIU6zuC2fJZzXnd+GsaQl39KlnDq+Ff6GhYk
         JlGF6YhhkP+5SiC0poMWbx0QidddLdfBHL3FDob+Qdw8v17MDf7LwAjE4YABd9EhJP2Z
         TMYjxL1bosU5W0tiVZDZ+YNDQHtd+9LqQtpM/nqT0WVHWxiZYDfsgb68vmqKppdM9XSP
         SeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        fh=M08x/fCxsaklCw/blcJBFrL+CVcUFQ+DpjaJt0NGmMA=;
        b=U9yedBskTUbzWue2p2jKrsurqOGY9r3pJ9G3stQVYzwASKELXBy+i0X5plXcJSNhK+
         uN1shUTAzw0NLjRPnRNEQ/X/M2dqghGXivOzsgsRh/YLgSWDAE62V87u0r04oyTlYkhp
         67FDRUSG5RasGAvSQYMsALVs43AUPpocqgPyg27gtlDMEjsEZ55VwjRuyOyucAFNY9qF
         TNTz8hQUeSJKr/lncA7jVJmGNo0sdiUL2F4AeDQYHxdRFmyd3uibwjZ+vhSMDPG6Yyai
         qFDZI9vvH/yLNkpDO2Yt4pPbvYP+7mfSj5p06l4RhgHAMvzf5R67Z2+ekd7x/aUPL5qG
         XiBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784966449; x=1785571249; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=bOWROuB52xU9VSLychp/1xC7v8t1dhzlM4GtnIrxxn/Yhvhcj4F958piISlGoZGHjV
         jBPwsa+gHgd5ZLGXxC09rGHnJZ7YeTR1Hu7AJ8Iz2sK++MdzkKuVbjj0CNt9f/ynDlDJ
         6iojrOthXmRljvELZYD5hK4i/KsZ444aKKuwJYr2NNyDTMbmIcIwDw3ncp2zcWrWGGNr
         +T+CF2DQitlMjSj60MxEfSe3ahq51pOaArAPHK24hgfNac9nvtMHBYiKImFCk0xLHw5C
         CvL3LMMHXXDf70fNuamDG9WIFmuhhwo/1zPiNKeQSmyYW7kiNXQAYnZ4xEi7HtM5hZs/
         kihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784966449; x=1785571249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=13z8xjIigSLm4fcji9bQpCPHK39sYQC+iiIlSwrcSfw=;
        b=MHeoSBYKNWRgTfn2qJbKVuDzE6h421zIwb9OFDodsioDK4ueukQjyGIpztI5IzAI+5
         gjf5D+3mdJopwV779E9Oe1WRpm1hbGVWPj0qyYsNq8se5zDIdyaAT3I81anMEhnx+vGA
         Fx79wB1UNGZnNYDQMy6J9cIPDS5P3r2iMegPMi+HwXXCw6E+NBermRdEwfoi6NinHxgC
         S2J+anEGQ+yG44zwwCSVu17ZYWyh5xDDvIIKsq7DuJ2il/rEE6x33xC7QbhBIyuBBOMe
         7Rk6PUPRp1KmKbHwvchXkR+ng9BsRXNarXqpM4AYvY10b9IS0oqjDh8D3nzo1w4JFwzP
         w/1g==
X-Forwarded-Encrypted: i=1; AHgh+Roo8DMNtbJnx8HoI1xRKZchiicB010zMag4QIyvWBo7vq+Yow220G06bH1s1OielRMbKGTY0JOuT7qz9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kmfL+SuZKv+OiF647WWzudgWR65ttrWA5xXNw0XZHAd1DUQz
	FBw4E3gca1dMYMioRP6qYwxyDuuI+hWWbwOPdaIbGgjkV/Yoy9Bb0rp7TylOECFDROdzbvwQ6jA
	c0/o0dFwePg7U2uH2DysTRWws8ot94A4=
X-Gm-Gg: AR+sD12b4KufJ0CBO5q3CDQSX7SNuszVssZsxUQ8W2uGAuj10CXpqDJDZeQzK0ysw9U
	9lF8/MRVzpo6JZOOU5Nf9DuPBw28p5MK7nBfPnGZwJInr1vyCVJMbp58ywIrmao4EUYm0F2wVCA
	5CBcZj1PKaJwg1PuiSJENK0/rYZWO0URDFKPZfFnexwPsoXcoUBlhVr8DS9ANsan1zSL0AKvHpz
	2Hb9OuLzqiTw0PNbmqviz/8akGh6i5tSoMsbJ5EXj84Aj86g2VJhM4POlpac52+vatNDTE/c5bA
	utczkelHt+G5A4ceGTnhbyp77GpJtWMVj0e+2WKPZiuw8dJCC9yBgFzkYhUXZvc=
X-Received: by 2002:a05:620a:2681:b0:930:dd19:11ba with SMTP id
 af79cd13be357-932df6f0f30mr100360085a.92.1784966449572; Sat, 25 Jul 2026
 01:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
In-Reply-To: <amOO86K_3wuTd_92@lizhi-Precision-Tower-5810>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Sat, 25 Jul 2026 15:00:37 +0700
X-Gm-Features: AUfX_mzCV0IN9fI_10kkKdi3HsilTau4VYjXeApWLMbv2AYQ88l9nYF0tHwG8Pk
Message-ID: <CACak8wNJsmVKm3m+JwYPSxqfa26MVFRo3jE3YrppJPi5SBBAUg@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> Mix use runtime pm and clock is not good.
>
> You can put clk_bulk_enable() into runtime pm resume call back
> and clk_bulk_disable() into runtime pm suspend call back.
>
> Frank

Hi Frank,

Thanks for the suggestion. I will inspect the hantro pm_runtime call
sites and let me implement your suggestion into v3.

Best,
Tharit
