Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EFD3B7B71
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944665; cv=none; b=VljAAvHkWXPuoh71uQMA4u4C3HW/GnjCIOvNgipnt86ERPhUvcibmNWHj/+rRHYjO3dwpVaDF7HCAVsc2LJRYadklEEnhbeAkrA2gc3b0CEFDTiPgqJYCNlVQQoR7veLfaz4nshHe7MYu3xO15yfyxNXWThIV8P1aNgRl1LTxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944665; c=relaxed/simple;
	bh=HnU4kWZIC2FYOrGUoJlJRSkkhU2di/64Rs1Ii9SY3/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxIR1lXfzIJC7SHaVJWvMxgGGHAAUskx7NdseFhrzB+oQjQD8ZijyX1EnDR3Y/qsE2wJvU+e4TCM0JHY0fYT9ytSOmwtBxRTiUXH25XdJNg+9gB+QMYbq+v1EGQNmWAvDphUl6h8c5t2V6VTvhmX5Bj7i22NaR+h0P3blD4lx48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDOTpmcr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDOTpmcr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so7864405e9.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 05:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790944662; x=1791549462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5ww6Bz7QCqZ+BLpW558mdaYqNluQJu7aeTpj/e7f+g=;
        b=SDOTpmcr7R+MYploEkEBYn6hmgtLLTkZF5/1cG2G3L6YJTxYnsyqMy12nzWMYOeSln
         +qfzCQEpZptLibEt/5Q4CQ1+n0Iv94l8T7n3+p3+LQbRb+1fTitwngxjbQWaxbz/+0Gz
         7TYvagtd5sM7s83JEed1FI/dsO8E2HkMs3vrqCg3Ccy32a0u3QmFAZhrqWdLXjRxNPyJ
         rFsHS5hF10B59bpInZtbkcjo6rEHo6TuLUSxdOgBodhc2d5yxAnsdDwk/00r9XiXEVBK
         KOgNypT4BarPUiz50+yDIOtI/qrSB4j4ZfOmQgGiV5kW6C2RJP00+b8C2KRAvl362LKl
         MMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944662; x=1791549462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5ww6Bz7QCqZ+BLpW558mdaYqNluQJu7aeTpj/e7f+g=;
        b=GUXEkyYckZpeU2zaQa1M/g1C6MyWquzpOYRhLxZOx8RB5PNGAvT2g3XG+zIdZBzIjW
         ZEDndx8EB0YYqwkXwDrGh0Sq5t5JCSq9IKRTiJ7ZCGKa9gunrsh18dyecmKMQsziE04B
         wrrc9F8j2aD9TM+RYPBJdNR6xRroWPKq1GnnkRtZb2iVb1Op5HBMHobCsnUDjvtHmHDc
         2fucI0RJxuX/GxiNco1gEEkGLYom5ggA0dle0R6NC2FiW+YaDFhZZ5eChOvFeeL0i0oN
         Z0OJeQcmodgTdkUV1N2T2XQvsXW/Jx/cz1I7Nq/O/aIYT4FFhnRVOL/ArRIZ3csSgk8E
         u0Jg==
X-Gm-Message-State: AFuF++lYfyvs/qzqoiF6uL0uH9iho7rPnEEOuICjvxHrcIzpJ/daDTJX
	14x/9JaF1bhpys5+/ewQDZMpICLJAUdkWMThgXlPS1wMr/bztTk3OPLi
X-Gm-Gg: AYBFou3ddnKXOdOxdZ45nvwR1CelqSx1g6SaKATG9cawHl4A7KMMbCV8PZaW1f/oEf3
	0lQhONbonFT+M1jgdZZEKQhwJwnZQtyPoaaa0fah7yjaQk5YgDhEQhS9UAhCqmt5a9woQODKsaG
	cFBqO+vNxSvrIyEQ5vO5ZUN4T9I/XPPMg/42dIm4t21DMkc9JQRBBxdQ1hDpCu6m9YLDwhKt29W
	k0qNoMWeOMXscRue+3DDCN4SksQen6MfBEtJ/h0aKoJqSWSiwGTmbjoFWrfK3S9Yp+cj7EQVZtC
	iQPo+6b5PIplWHN+XDS9XEBOyy5htlnrPWfVeTcqY3cIIZZdGtPeCvebXVWZk2En35zPz3iEsBk
	8IG3CxD5KGa5wpnN6x6qrxgCetHvKb9oH0lKfmh25hR+4iTrGinTcoMntXVzD8KK48NPjG5ngkL
	wRZa4m7Yg4CcROctzO+cd9TWw4hodbdfzl2mGb6aPaZlXZ1/wMYgVcpoDWK0tCKZYwxHHqJVyjL
	dyGywLKPlV6zs5aWP6LrDzgzwhYBjSM/2Uh9sxhywRlHZmHoRRjMW/ixQ==
X-Received: by 2002:a05:600c:310b:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-4a0276a224amr48002445e9.32.1790944661802;
        Fri, 02 Oct 2026 05:37:41 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8015:c00:f8d0:4e92:554d:7c6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm101118245e9.15.2026.10.02.05.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:37:41 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH v7 02/16] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri,  2 Oct 2026 14:37:38 +0200
Message-ID: <20261002123738.734633-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar-JBnMLiUci85O9@stanley.mountain>
References: <ar-JBnMLiUci85O9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> What is the actual warning though.

There was no Sparse warning. I ran:

  make O=/home/mauriziocasciano/workspace/Yoga-Book/build-output/media-v7-sakari-ov8858-20260902 -j16 W=1 C=2 CHECK=sparse drivers/media/i2c/ov8858.o

as validation of the final patch. Sparse checked ov8858.c, emitted no
diagnostics, and the command completed successfully. I listed sparse because
it was used for that validation, not because it found the issue.

Sorry, my previous reply misunderstood your question.

With Best Regards,
Maurizio Casciano
