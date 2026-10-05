Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BB447F3B6
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201686; cv=none; b=iC9rkl575CMnERVxrEVzDC5sdiXI+5YkejAoZ+203/6E4SvLMiosJZpe2RN5s0ctfaDsWMzcwgXq2mPGK1gY6EfkYfgv/CLSxQSuV9mr9MdKUJFxH+EGKn3etphHi8GEibEuWKaiJllv75ibGeSBCIPbVzdiXMdnm4tJmJNf12M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201686; c=relaxed/simple;
	bh=lTbHYXamvq3cnhE5P2zC3Gd5p5ztRUE9cAKp8XyYsC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JV7+n+paR2MXPWWY7wEfjAabmvpRp2F3sS2JHyV048AUNh1DhMUd5H83SfABr16aXfPQLjOPpiCHUJ4k2ErJH4EDxukzDhJxgUyOi8fmonckjUoHlrz8G5rqZN8KlX23TxqQBvSgBVyh6T3n2VuOEmNN7iXO2J1bOF0OoTmCnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R16t1QrG; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R16t1QrG"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso15705845e9.1
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 05:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791201683; x=1791806483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJrqgb3DvlowLzYTH8xBUPpuOWe7gYDesS4AaaCm1Hs=;
        b=R16t1QrGyVPTcvEvwr7aNMxGkKnyC9xa2vHpWb/tCZANEbW3sfU2tYbpX5kZTJuN17
         vrh3cP0zdirUDrb+an2GIsJ4qxL5n48067Vzpjj/5hqwffAKbVVc/pKUygHaUEc7Un4n
         4Q8w0k33h8NNy4QuSQ3uEps2J9eMVZWK5v/bzOsdjVQgTgt18CmVcyCMKUrjgWNqxBhm
         X9bqE6oSuyAKt8DFKDBLd9aGoJ181It3jei1C8rmhWhhzcAy1wuWVkoFC3A7ibg8DVSR
         1cLH1rvzMXxTII1ayLQY5MhBOxSf7DaX5MvAStE7ZqKkdwFkEON1sD3lebh1hM2QisGO
         YgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201683; x=1791806483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJrqgb3DvlowLzYTH8xBUPpuOWe7gYDesS4AaaCm1Hs=;
        b=JqsBfM2EPx7TWt674njdejTnlgphO7WzYs4TZsfA7UrrROU63MkY8ABzSO/kA11bq+
         PVHWx501ZrC3cReS1dD+qFCif59Vr6sNTJ18MXluqR/5xH3ouQpgCGZnKlg+l4MbQ/jb
         feos0gT+3U+Ay+f8Sty/QlzxJeka+VAUh+m0uEEHbGCnOLohS5NASmGZ7UHCAdVHgVIt
         oxEgLg0xNEOK1GCZAgcaXtnQ/0JGbqsPFS+3d9KnIyNVBaS/yY78cZaxog2l4rLNe+sO
         ZWVs2UOdQz+JCyqHpyJX2KfH165tvsGilNrRxUiS2968Wb3uWYxUSMEFAv9k8bLJT2gP
         6UhA==
X-Forwarded-Encrypted: i=1; AKwUvByACH+65p7uSIqS7vr5g5wKyoeDxATyTQg4rQqn2Zqx+VkYPaCBiqoncreebgmlOmDkj4e8jt4IUFazDw==@vger.kernel.org
X-Gm-Message-State: AFuF++k0RY3VXdjb6N9jcB1pwE69F1AbeBYxIJh5VkLQNZQyrTe4nLGX
	rwHqDfOW6GiQrEax1ZZn2A9YUB8BpwtfhLKyw1BAb6udwsgAucdwwlhC
X-Gm-Gg: AYBFou2nzB9ar8V8w2q8z2ZbHX52oVlDSbDsY/hlYgSwH4zyICnSYBSn7fjIPcVJXoT
	gyazvYTD8/Hy9sAxujI66W63i3Ul8mDd8u/npQjJgcoX1O3GbjAtOfc6D7KF/ZIdrPmoBgONwRl
	OR/YA7uHfU0uL65MnqRXYz3uJNJsWw/XTwPwHByPM7/SORNjVJgoJ4uOO5jz81AiM5MJ0iXRh4U
	Cy6yKVevHjcVoffwWel2wzcA/lGhKAxZiFEwHOwxmCeWjTkRmbd0zHFcK8tw90/eLhQRAYWp7l0
	it9Gf9ln48/jvtX4KsVI+cYYrdcC1mDjCTFR12e6wQ3P1dd7TGAftbydG3iG/RnlIrQ4GGRFzB6
	pYeu2fbdheSM5BAqDM+BWrS+ez+k8GX78pdtS6HzMU/7JM6wFZpXHVr3nOGaCJagfrE3lk27HoW
	l9B7YzqjnPKF5J7ywiJpioQYONDrP2sZBQNIXy5WhHIg00v5TuNYNK/ngLeSqpKC0svC99x2DEh
	Di/niYp7XocLqzeZR7pWHmPI2m0r12C6+MugcKReZzBj+9YgdG0TKElvcC22+P7ijoOXklZxt3t
	docj4UydY1DpIUSklBuZ6J4aVw==
X-Received: by 2002:a05:600c:3492:b0:4a1:6c3d:cdcc with SMTP id 5b1f17b1804b1-4a16c3dd377mr98453135e9.15.1791201683068;
        Mon, 05 Oct 2026 05:01:23 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03043fae5sm202887735e9.0.2026.10.05.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:01:22 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: conor@kernel.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 14:01:19 +0200
Message-ID: <20261005120119.17604-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asODx3YQa4WlANen@squawk>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-2-robertbozik@gmail.com> <asNbwhGCuxF6e6Ba@kekkonen.localdomain> <asODx3YQa4WlANen@squawk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Conor,

On Mon, Oct 05, 2026 at 12:02:32PM +0100, Conor Dooley wrote:
> On Mon, Oct 05, 2026 at 11:11:46AM +0300, Sakari Ailus wrote:
> > > +  reg:
> > > +    maxItems: 1
> > 
> > minItems should be 2 here, for the always-on client.
> 
> Instead, make it an items list, so that what each item is is explained.

Will do - two items with a description each, the sensor and the
always-on block.

Thanks,
Robert
