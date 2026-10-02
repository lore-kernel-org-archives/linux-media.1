Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D2455625
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932349; cv=none; b=HKCuTAoStiqD0qwskBGkMvOY7MJ1mS0A0VOw5Nmnb8eqoMmYoCyC4nAdyNGA82W/6Tx5D1M9+bchzNBUzb/rBXdP1UmbyMdWWndJM83AqdEZXbZUDhN2Mr9W10eLSUIhEdurMs4eCDTz9NLuVvyZCxW2AIwjS106mrLKF/0r/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932349; c=relaxed/simple;
	bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I59uRmzv3pTZzaZKW1I9eUkls6MLgCXAO6jV0bmIzNI0fBa+ckrk2oKvrUKAxWHyiycDhnnc3wD3tM6X2DSqUBRDzQtPMn7A/KyHPcaB9dNi5XXSiirIyykQqbwfuFQGhFJrgDN5EA5dmufLgkanvubIxOl7FmqIRX1IoQGEj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUlOulem; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUlOulem"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a0280d4f56so3446105e9.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932344; x=1791537144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=UUlOulemOCwBjHF57moMGSfeGIyvCpB9muYs3CRfcO9zkKbV3np+EIF9OgJLX/xTFe
         iR6veeyd/YpAqFBCkNa0nv7VPkl8xYgmPAZTYfWcE1UGws2U2a5+pwiaCl4stJQHeuei
         l8wN+krXoXY0ThC9stAutIDpTbZjJxf593SRw/6lBpnhZUd9cQkwqjuG0wFYvO86tA/+
         aHuEpBtQKhdJBzmjUvCQ+C4suL2KhxYs/R1QnSJkOwMz1q3+pWwxEH5Onp9ULpPyIeeS
         rZCSBpL+RNS9TXP4tUeF177ziA/8aNGcyfa5hYHhMLfU5MSdpwtSct+tX5eig5Kb2Bnq
         y3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932344; x=1791537144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SE7O4E988zSh9vSP67BegOg04lMQBsr5loyDqg4tI1c=;
        b=oKO9R6ivt5G+QhLQqFLcm/niZF7RQHiBqfM/NQZcmCUkW+xPb4Nda9MlIrStmVta2v
         At4dHF6lc5W7Hyq2X+QSVEFqpvjCcOp67/0r5WV4R8fsVd6r4oXkSxJ+sgrRFChzkzcE
         yDbsI30Axm4SuA2Gp4Y1XZPO9cTFoH6iVEjxE9XCu7vbTYCTiD71KgwvDjYrs8IQXAPI
         axlmHMvskH1TxK2Gtz1jTELvU0g6LkExENsJAQIWdyq7QKw+N6I24dgUP7Fgsbufg1aP
         CWm3yPtnYjFS4JjfaZ8uHKmmabGtxM7ya2BHt8/vHSklqPq666nBL0E7AXFp1y9pV//q
         NKpg==
X-Forwarded-Encrypted: i=1; AKwUvBxjBE/3+LUjo4FQ/+FpX6doDmxIgyqozeX9EuVfhtnte8wigD3wgVh2La4JTvi+Q74nPdPSFP8aKxCwTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nWisnsH3KnK66RVBNoL5AzJLJVffhgH7LYl/kAfG/1Zv38RxRL
	L5VX6PaFt7IrGdSVW9K9/2HwQHla14xzxhbouYI0nrjeO2gthItXRdR6
X-Gm-Gg: AYBFou24O5H9tmRBNP6Uq9B/M5PBuLO9suy/mmlf9oOcSn9P+VOMq5ugf3q+hu0QZP1
	wyRhGV8cmglwkSGnuZkPLdSEsd03QrNCBpeFBavgM1mYHzlUmvR+kp71FP6LKE/NPWAN6YWduqN
	uzIwv/YwkqamyRNBW3qJQ/B5/7ZgkTDrtwA8f4Ny8XmxGaCf14MfnuLZ9bXFvRdi1i2bQt+PKnV
	vEDayeRVVExQnOCABvxEnleZ09LDmlfqeXHJhUsOraKWqYlxeyG5lCYIf0jCib/XQHsiQzbKYKr
	csXNjZaPmY+m7isa8lEXafPkKJJ5L6lJ7LmGOmY4TE2YcEYwHJ1mzf3JgeOdrtC0pNqKm7UGqCo
	hD5qjBrJMJw0Y7gjhK7QlN1lgCFYs1DTQinGeKPdFic2uqwCY6VKCpkAD7kdt1runEndeOTlKko
	8BFNh64RKnIPM7/XVHzes4sXpMwKnXzfQLb+C9HjGxSN+oA7O9PEaLl9f9UbLak2IYIi7F3GCo1
	H/B36+flylX7dcWSCqRQgJg7/8ZCXg6KJlHSLsQviDui5X5PcreW6NC4lU=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr41194525e9.27.1790932344110;
        Fri, 02 Oct 2026 02:12:24 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm4006072f8f.45.2026.10.02.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:12:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Date: Fri,  2 Oct 2026 11:12:20 +0200
Message-ID: <20261002091220.534813-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com> <ar9wlk34f_aNlIyz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You're right. I missed your reply before sending v10. That was too soon,
and I should have waited.

I will not send another revision for at least a day. Any further revision
will also wait for the v10 review and CI results.

With Best Regards,
Maurizio Casciano
