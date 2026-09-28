Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96F4BD790
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606106; cv=none; b=rXgCfQjTUZ0qkIUFKHmWBdJ8JYL9rVzgatlLep7AYvpRvugQufwoSQ7sHzxxgj5yjaixpilYCzDaR90Wg+1fla0QHd/T6yMWHoHEEOx7G51HY1Ao6buBov26PBTqGhd/HowVFQrYLmVZvjv+q0GcDcESq0uMYgL1VODzJv8AfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606106; c=relaxed/simple;
	bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQ4DITOz6lZ1/677mzIeGs7ijR/096wPr+oiwR/kJyDJgFg3kwFOGfXym7Ns4SsFOtHJFcIERapd1/ksa4z1jnH7k1HIdoAcIcxPFFjf/DK4j7iBAEU+HalypAudnXR+owkYyDZvr3Rgqbkne/P2QQjTDnwWD+nphOjbjHhKFIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUi4gaoD; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUi4gaoD"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8a894197c96so22076237b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606094; x=1791210894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
        b=hUi4gaoDgdkI6810Z4BmPeBBwB6bZPMxmh4qE+r2uUwsVlWTrjqdBTJ54ajoSGU211
         ohvdesZUTryTswuOO2MLEk7iZPe9AwtyaEt/iJJlwSc1VOZ2jkM8yIv36IndmLnuq0j8
         F3AENkifCB4O+MgrbevrcQMNjt03cTtB2I1Lla+zhviTxCuqifmI4QpnhFvXg879Ansy
         C4kdKcJPh+ZWv+7dvAQ/b9LAlS8As6yjbWO4IfG4kFnGWNzXtqH12Al3SeHWvWtJaMBz
         9znI7/CE/0aywQz8TwtBoF7/YcAIXNI+ZcOPQvi6uVWZjGPPxrh373soE3PHEvEdGPcB
         WORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606094; x=1791210894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96+TdOqZAkRS/23bGnYj2WIeluw3dPCFqis+zSJPgEU=;
        b=uq0QMwLu2EvGTl2yLrBptQJVGnJWgrpopc1OWxPXbZJCbicyXzCM2CyA0EnGpv2F8C
         C4k5UVnXuHj8nQLPFUvvdS9N16ymFL521l/f1jfvdKQ6yyQyon+MVNsTRYVGe/gzufVy
         mTHAbcdzTmGutKEbj4M4bsWxv4AToATLm5cl0sVvFetkKHgMV02Eatgy9yoo5E63LTZG
         dlCKrugwf8nSF6bsCt716wGtUL+YOTm5rzoaA6IW8zIgfmmOkffSPzwSbMGqyh1O0TyJ
         IgZEtGlCrl0uop8YYPNdinkV7eTGFeRjbbccX8pDo4KiZUppN/BD8XdjX+UZo4QgFvdj
         6hMw==
X-Forwarded-Encrypted: i=1; AKwUvBwCJ69GiJeZw8RynfF8TTc4S3PuLdlZo5OJzYKesd5FS9wEqwkPmr+CS667fAgu+ezfTFsXKZdkWtcaHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDseokhksLlTy8uUfk6JP3pGrREJSgRaKZ8+R0lT5XY1XF32Qh
	R17XWPs2jstNUsJbQQe0tSId8ZuVqGrRG6s+UGQ2uk9NJF53VuhpTUJC
X-Gm-Gg: AYBFou0rJCMjCMoBfDXCZrbaDwSaMcgK4fu/3TSpJC4lVFzm+IKpHY1X1pXvOLHx/Im
	G0Wv+BRBj2+fNV5Is+NJPG0VFy2rQgGhkc5nNfspufs/N+oNdMNzaGimMs7nc3YvqTTRnUAxreY
	sdSfH0zRJu7h7+ze98sDrrT075qWl1Q5201zONtu8MaPts2Vs14aH4XqpBeyemZuZKdpXTvdpHj
	kLNtdfhRInskZsVgyTVgTdj91/cbe3ohktN80jA2rjkJRi+HyjAjI00RFuhsLsisRtFvVfIkoib
	1Hemic2NhBgQ1IzA9kEjcjcFY/Qi/So0LAX0rsOBII5puhJ4OQcDpjPHJMyQ4Pj8wICSQ1BqcSx
	SPb/L3GTHzgCa/TeTQsk0JcgwhTrUMkNccL6NTneMIKPnVeWnlW0QBGdvYN12eSw4qCt07M+GHr
	RCP6MxZT/Q22XkShVIPEdcb5eR0f8ljFjBxH1xVWe7Go3b3fivEFgfvQw0XJqyAkHAR6FEzbcyz
	yqW6FZsWrc5x8GwMhjZigSPX+8m9LLrtF30q4skP5otjxh13ZjaHTo=
X-Received: by 2002:a05:690c:c4f1:b0:8a8:719c:e4ed with SMTP id 00721157ae682-8a8719ce5b7mr33125107b3.34.1790606093575;
        Mon, 28 Sep 2026 07:34:53 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860325fbesm45609627b3.5.2026.09.28.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:53 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
Date: Mon, 28 Sep 2026 10:34:52 -0400
Message-ID: <20260928143452.757713-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com> <20260927220625.629672-1-jordan.mymail@gmail.com> <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com> <CANiDSCuNubuJ1RyTT4g4PORoJzEorwH6CFmcPnXrkRYccz5deg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Mon, 28 Sep 2026 13:18:18 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> Since Hans is going to merge your series today into the uvc tree you
> should do c) instead.

Will do: the Tail 2 entries will follow as a separate patch once the
series is applied.

> BTW, I am curious, did you hear anything back from OBSBOT?
> Could you also report this to them?

Nothing beyond the automatic confirmation; the ticket has been awaiting
a reply since 2026-08-04. Their support channel is the only way I have
found to reach them, so I will report the Tail 2 there as well. To be
honest my confidence that they will respond is low: both cameras work
fine on Windows and macOS, so I suspect this is not a priority for them.

Michael
