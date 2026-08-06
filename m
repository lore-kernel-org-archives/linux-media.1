Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44273DA7D0
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054823; cv=pass; b=CP6TT0xwDDDr/TNRiejLS00I9YhOypJuplY5Wr+b7kAvkWKKRy6K5+JsuiitM7lu3sPtDfdH+1hCzXhTKOaqmc4TdKvsCom198BYj/u8U8h1Er47SqmdZkCbEg3deNeCV3xi5+6AamgPCsBoVYOYyCgxeK2aZGwJXzAgeUKrgBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054823; c=relaxed/simple;
	bh=j7qp5naODfpb3Aj+I4YiVLLP14vCgCqZoGx547HazPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arnEil3KO3R0rcAfqdFzEUEtiv/5pg7Wb6LS0PGe4D1sKWpNF089lJoiNM4SmeMGHk8XMFQTrjizYAjVFSPx+oxmJf8kp84IS02DuLS6I1pw7zhqrz6baG+2s6jWrtwLm3xHv7GQkw4NT6Xj6TchLXvP34mUydPNnWiBiwkmY6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj6C1Zof; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj6C1Zof"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d004f135b1so33275665ad.3
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 15:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786054822; cv=none;
        d=google.com; s=arc-20260327;
        b=GiJ8fEqla3DqSlS60xmldaDbPEJhJ1Sk9ZhnFtwwyjUc5ygL1tx7hs6omjhDT4sHRt
         Sk4NTQGgc9DcgmC9MCo4HJrUYsEGl7Bs2uDIgCk3BY1IorQ8SZng5U5tAa/Xj6/H+Cud
         smjyXmfivToonRUwsfMi6mVgxj+5mWOBIGyKUYI8I4JZk4E3NGq4GQagdQ5IWKyKPKRN
         0RtEGlB+Me4PTK8FDUwLXLsqtSmKweBB9ZUpN1f8uY6MAIt1IjMcsfhp+IWJNbQOwhN2
         9q8xVzRHViSfXy6R1rFBhTDhEM8nM3pnabq+dSjffmpfX+YuM1uF6IHvb+b+kPBjInZn
         nerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j7qp5naODfpb3Aj+I4YiVLLP14vCgCqZoGx547HazPk=;
        fh=LZdVKNKwYmekN6lsqTx7gNGCr5Ep8gdtBUhLZ6X+1IA=;
        b=plOph8cOB+VY/Ry3Otd6Kn4UsZu2/JogkvZuBBMO0eoS6lAU5ccTkHbIbLjwpPXMhh
         XWNYl18Wk+omY65R65fkWZKzOf65eBQp17xOmpgGGqxmzDeXev3uaMvhBpI1J44FWitV
         jjrp9m1fMYImSwaBNHsqn+Xw+ML0faj3ZjdifpC+weUW1/QFLNCwmBvvZ47nCD+W0hr5
         YbMhNtrrc08tfOxPw93rWAXJ8TFXSNezJnuGi+Mlq3FJZUmLMSE9vYhf7nynkLUK645c
         Fp204GIBe9BpGk+ySU5pcEQSKo1L2aYkArpSHmKO6Pk/N5Pe/dBIPqewIooOQjRo/KcX
         Og4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786054822; x=1786659622; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7qp5naODfpb3Aj+I4YiVLLP14vCgCqZoGx547HazPk=;
        b=Hj6C1ZofvuzyR0qTzofp35WxohesLaDkiTLyl+k4a1x727klz8byg/r1Xqom8RZg07
         D5O04Oe+JTSm2c/+QhofoAPBTS/OVqCUyMO6ztTBDgmbRXCZ+VrbDMgEorDo27kYJywy
         IC9iEFdUTkV56/D9gH60XkN+IYomGskXhMVBHpC1QgYXG74DhptiPo0xDtWMmaaIkJkq
         3ZL2567SpTq2pG6pM2rm923E1Q2AF7NbV4CIJpKPR+N3DOR5zUJEo4hPDynlVouBcUuH
         EH7FkzZX8C5C9BtO8bIBXBAeXIrUWr9fvkR6EyWs4bsOUYYgnA+4AQ9FTbj4KKwWMze4
         Y6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054822; x=1786659622;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j7qp5naODfpb3Aj+I4YiVLLP14vCgCqZoGx547HazPk=;
        b=FOWa0yqO5q2V6MEa8r73zlTkEZlBwEpRQTHM/DuniFskJ6KX4DzG9IYARyGMiq4Xk8
         07ORwUVzIORFnR9Ki6G07ymlTvaW7PTaDMCSPk3BTBwe1bqFSOS6HT4c+uzxF3yXH0s9
         ZRA/gnzxMr6fLKIjhra5CoZUORBbJsqFCaRLmL7GuWZP5Jzw+UbSkiQPrzFAYJLVLSlD
         OReD2E27Gz94wX3cZYt2LZrTphWAAHX0RolNTn8oTYgrkf/LX40hkcPjb7ZkbrSE62m4
         xOGgoVv9f5vWOnf/+g3GxMJ1FpxqMFtwgz4PcPPcOZ3pwesOnjrNsYL7dLe4zebYDTcv
         oltw==
X-Gm-Message-State: AOJu0Yxz8NKu2os+wVbMurEtRRMzKNYfg2WOplK/hJsfK2zg+rvOye4c
	Ho7BBzRLp+VxQqJxYpE3IpR2wNbi5YzFr4X0pWcDGoESsSHpvj4FY+4fCtLyDgmF3zYyyOxAP57
	DhVUkBBqyu8tVlEctYpj3ofwifJ5qFRMYIIBe
X-Gm-Gg: AR+sD127e5U9q6XYJIo+9lUTa0xnoH5DoelDBiA2IKXo2bjQDhT12/4JlKjFyz8CpHc
	bIRyIS9LfzcUPNLchGYVyoBNf/Du4mCRS+T4AmWLYnpxjMHskIVJA3EcwX+J2KV7fuQAO7ZjS2w
	NDFK9rxS6UOdHKWMUB0QlXYUAbF8GonhwXxlE2b3dPdVtejgwj9VGz6yBr+0BkaS8x9FmhrI3JV
	vFOnwpnf5P+mYTM5wGjavvbRZKWb7I2QsQz7dCORcZfYHLGSOgS1glOtLv86AzlZ/svOwZEbnFm
	ckkXRgGeu35hkMSEvESGPw8+iYRof1TFK4xBFCa5sLPUvsbqYDNARIgw
X-Received: by 2002:a17:902:ecc1:b0:2c9:fb11:1bf4 with SMTP id
 d9443c01a7336-2d0ca7b5436mr176526975ad.7.1786054821773; Thu, 06 Aug 2026
 15:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630150403.46327-1-nikhilgurudasani314@gmail.com>
 <CAKD_UFRKWzAahEpxhjEQiwzgrwmqhAd_y0AQzwo3gtz_j4K_mA@mail.gmail.com> <CA+RexfEHzCTwAmkaR7r5pbwy8aUUW0W-Ce0=XnnbYT5xY_HL+A@mail.gmail.com>
In-Reply-To: <CA+RexfEHzCTwAmkaR7r5pbwy8aUUW0W-Ce0=XnnbYT5xY_HL+A@mail.gmail.com>
From: Nikhil <nikhilgurudasani314@gmail.com>
Date: Fri, 7 Aug 2026 03:50:12 +0530
X-Gm-Features: AUfX_myJp_afYi903Oi70lKmHBzHiwq15KUVsF1wIoi1AY3-UyFU3E3hLZLxEis
Message-ID: <CAKD_UFT13zVDgMTFcBvL9oYmu6xhELA88AmCaKM+Gs-JaZNpCw@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-frontends: a8293: propagate set_voltage errors
To: Chuck Ritola <cjritola@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 at 09:32, Chuck Ritola <cjritola@gmail.com> wrote:
> This is more faithful to the original implied return specification in
> revision 6266daa65234be4bd9389bad13cdb2f64bc0a2ec, and could prevent a
> potential regression.
>
> I like this change.

Hi Chuck, thank you very much for taking the time to look at this. I really
Appreciate the feedback.

Best regards,
Nikhil
