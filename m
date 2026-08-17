Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48343AE1AD
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003515; cv=none; b=Nh/lKCMjaTc1/vK5zsqqkWBgM67UekOyTZr2pAseDG5KfMZkod/qHWjLeggGeeo2BxgzbkpVjnZFQRA3QwrWhc8vR7gBe0lH5WLTFINQU+2Ri4LTLj5T5q9tPFVmT2THKGCWhQErGrHmWjlvN2BnSDuzSPjFmXvUjMTAg9TfGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003515; c=relaxed/simple;
	bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=tOUpx6DQnIouSvSy8TjU8umHu2YYvYm9h5XOlPXRSjROnO71ooGHe2Hb2KNmJgd2QxKdXbWGpuOa5ciRqnYykYF1F68xJUcIlxR91y2qYtgb3cXEBCVaJidAVvo9FkBtDbdSXa+wOR115X0HLy0SDBxRl90QqCNUrLVZg7Jzy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxSIKrC7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxSIKrC7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso2171089f8f.0
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003510; x=1787608310; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=DxSIKrC7OWT3udCwLzo/m2GVuYeCbwUYybIylo9o6YoqXHWKkXjrfpFISGiRNRcRhF
         MXl/TXCXX6uIP9zhKxECeMscMv4s9ylHyjQ3N+YDkYh1v7n0Id1WvQjXUjosRpWaczSL
         NFaR8yNAP9SS0AVlBFLtC2WdwcOM+mbBsU/dQ0sVURxWIzaHIiLNiRL9FKM3MsvcppAc
         X6CkKjoMQUQZ+fS2Thu6Y6soCClxqrDp/g7NQmqq7rLFgbqIp7q2sZwR2ZBiWggOchpK
         YgnhHBpdYcpZwkBSX9TXRK2Gl6Pd4JqPbnfmazmB0tsq/igNKCWRb9oEPZCIgFoX3Ylt
         QRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003510; x=1787608310;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x4sjN/AKaWAGZmeBH2ZUcp2UwC2KUwkjlW+z2W2URIo=;
        b=iR7/9V1l2p8EKgMwefgA7SZ7xIPJx6wlzNzyiq5/iUy6CzFbaERtctKniEEiHR0brO
         HEti9bLs04eQOaWYHp3JO2KTYgyoaFgN4DL/JIMTxcccvKf2PljCcqvKevdLpy7v/cr6
         pU9pCYw+mGiuBGOGn2tmVIgPDAQ0Z36RQie+sFiYnpyEBE7QyQw2VXyCJhA4WGQvg6BP
         p2mYry2TFU2nCyKncgaKQu/AlGj+OU7O90idFSmPJSurJGEYZidQVtjy5c1xQXK9YbYU
         Sa5vtLVEeI9OqVRhdcCPDzO72Lcmxdy1b0oOAIcleXYBND+4O9bc0vszdVajy332A8TP
         ZKTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrQzhbLzaCfnTfT38O/Pm9LkZ50EjemC0+m9u1vXhArD1JCRgQdtcyXkfvdeoc+WjlhtaOUetHuoaYhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygMqppIcSkLkzqQ1U/AUhP8RSpoyYAHj7LjT34RZpxLqQUl3r/
	2lzrY6SqoI3MQlfup8ocBD1qcoA5PkjlU5qMWtYbOOQx/ej4Nuva4NOZ
X-Gm-Gg: AR+sD13iJGnGLbqrKhlW4EDjM+1C6A+zyXQGX4rVlIQPMcHS6kty5brE8UXc7U5Ogk+
	VbzfiXXpkQJrdkdl1pTlKpeMelGvzsXQ9h6IsEP1ccq9uoJlP8aLHyXroPxcQHi7PyQpyUsJkyl
	e6Ug+YGkOej0SJuKKWxMn7uQRvZmP2JB3AMPop2MFeiC6OhSb2DT3Hx//Ry/XPL1opWqlB1NGGP
	2VzUjlX3H/SKlaR+SiuSffGmFRklCY/EiAgk49U4GoI0E3UNZcDtUnBvn/I5NNseMiZEteeN3gF
	m3hbOr/6ZAOF7Sn+u0PEf6OfmL8QS7CkI+NnYa3RVIY7UwlM7reRcNu7G9JWhKMm0qwc0/In6A0
	Bfhei48thZTUDOruVluvSSFIYZ8OMdbEKpgDjJP63+F0zIqte2JO5z+xgP2KnQumgeEeBAT3kSp
	jnm6SmE6LYPThNx75UWD95JO5bn5IYIIv5X3uNznkUfuImBIqi+QUlmhscyGkEU2f5rpdimD4m9
	swc1owS7ZiY2RN6o8xCHnXVy6P9U+mpXGTAxaygfmyiSN7kPK2h3L3Obn+xrBU2vQ==
X-Received: by 2002:a05:600c:4e87:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-4998793867bmr392242985e9.4.1787003509504;
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b2a176sm309465955e9.4.2026.08.17.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:39:55 +0200
Message-Id: <DKRJMF592GX4.2ZR8HRZLIXWP8@gmail.com>
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>, "Cory
 Keitz" <ckeitz@amazon.com>
Subject: Re: [PATCH v15 17/22] media: i2c: maxim-serdes: add MAX96724 driver
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-17-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max96724_select_links() sleeps 60 ms after RESET_ONESHOT and never
checks link lock status. Would it be possible to poll a lock bit
instead? The max96714 driver removed in patch 22 reads such a bit
(MAX96714_LINK_LOCK_BIT) in its log_status callback. Polling would also
let a dead link fail here with a straightforward message, instead of the
failure surfacing later as a timeout from max_ser_wait_for_multiple().

Kind Regards,
Artur Andrzejczak
