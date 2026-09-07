Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8DD384CD6
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788817570; cv=none; b=kHNkLSzUjdtk7JbOHKSGXjB1Bh/UuHgIMiXeP7VYpWHg0aXeaw/QyKm2tRtzA5IwuYKWOslICIPiD2Dk74l7RqOpzLkgJKbpa+9r4dIg23awwuRTurfHHO17OgyTZ/7VGBBmQeiLViMbcLMPtUuUL767zCsVd/GXls1FnMfM+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788817570; c=relaxed/simple;
	bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Pt846hU2brvCvzG/8WS13oO/eIf4mZVhlcMVN7mVKzeNpJcoes7PmVziwubpM4P1updMtnawrNzbWo1f/BcjIzjp/YJk4pDSweGwd/ccv2w8WXBS5dBHXrQ8w/5coDvKnUSfVqWnh7wC+aBNcoxKGT4dB/lQUC5Yx7GQdYGT+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAnj/rcO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAnj/rcO"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so38527795e9.3
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 14:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788817567; x=1789422367; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=fAnj/rcO80TMH8HFqrvv8EM18bPhxCk3sdYwPAKLF6fGgFJsHO9sQuudWHzoLaGtuz
         hJMenQH3yNR9cJAx9610rIwQtPX2BcSdbxcZSKVXizwBQxtMSgw6siBRJ9UtS6jme+tn
         Sp5buhngBoZr+3vzzVewIkSq8z+eqLSJb1suwCngI4JozAxhw1sSFtmZjBPZ687Ltq5S
         jAnJ7L3F4tdiSpsCA3yz4vHYbUG/PdxGhjPob2tUkXur6fC7s9Kq1wRuafLJGyjNcWU8
         sRYQEDZW/KZqtb0BNPqg/5ZHfH57TN4shs8rHSoETT0FEmdyOsOix+3+l2cZQ1xHYsuA
         wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788817567; x=1789422367;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wl5rSlHC+XhusTlpiC8DIe+ElpjyZ14Dwji7QkvgQbI=;
        b=TE/qRBiDltDwwxi8PjE2rnHiMjJJATLkLXvVzpWRSPuIpZRwzp4+TArIfTxivzxi3f
         /E0mU37jOwwR7zskshrp5TT2+TdafdbtHM3avr7Fst7xJv3RtJpJrTapzPG3d47E1tbs
         QpPy8XI91fd7iQ9OywamXz4RQ1uhRSRPYSk1cAQXgeStF0RRpac5Utwc87ZY5wgkyV5w
         XicCKCggEt1cTm/nVKUxGmIUSDf9LOqP+LOrNiqTISqfgK8GDrT027BMGhhun867CJBY
         GSe8cGy1kXD/4x/e1Ha18OyuDjSFOrv1Vc1ljUnM9YoQklWNWTMznuDLyWjzd99PU+tH
         EA6w==
X-Forwarded-Encrypted: i=1; AKwUvBw1XKDC8He/PWyAparBVVPDN0ieVN8JIfv+GbhZbWYuAjtKGEiWycxJUGucjzy6sJXL7s0KpzRFs5BvFg==@vger.kernel.org
X-Gm-Message-State: AFuF++kcg11KJMdNxj3+VnPQosR0QFQVmuW8Sbm3+c91t0xJk8vUENJ0
	V/2OgIeMXBR5KNxB4JBoy74EUkK+L9BE3lJ1GJtePaBYwxBkNxjQfYl9
X-Gm-Gg: AYBFou1/JoYG7cl1wekuox1GwPa9d6SP2/TcAyLF483amsT8Q8ur6PQupGYBFneLHcq
	1e3GQHBvGXWvbUEwQra5r6JGX6Uv8hFrgtJfYwrQhAShQAjBySKU1IjdgT+MljNLIA1WIoHad7C
	dfMgX3J999zVS+lKuzvjhRrBvWyto37K46edy1+eyelaHfmlRs0cj3NQjW/Y7n5/MAYF+B4UXqS
	XbNUXAwbHyZnIdN22ovLePa7Zd3Zfmudy0YwS4Def8A7Vcsiw/eAqDBVcAOM/QcTba1ER4OWosB
	FaWVbcMcTpKo3F7RIw1U+fieD1vtnbwXje5i01xiLQoYuIWaqKr/wxhs3o1E780mJqFlN79wCgj
	XEqHek45mbwDztzDZB/RxHrsbCvIlE6k4f8C5x52i+wkHLvus4hnfy2U2yMOn9qkRz9GePiI/S0
	GmbaIW/tBofkreiCC+D1qUzpPvy7yeU/H5S75OLeJJeCJ+GW8EdEZjMd+qndQTekXUFu3Wj53kh
	TuS1OVefbau/mExflVvzC5jUbaj0rP8WjMEC64SGf6lYA9mxEjt
X-Received: by 2002:a05:600c:6290:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49cf7f3d239mr547293245e9.0.1788817567046;
        Mon, 07 Sep 2026 14:46:07 -0700 (PDT)
Received: from localhost (178.43.76.160.ipv4.supernova.orange.pl. [178.43.76.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm204268135e9.1.2026.09.07.14.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 23:33:35 +0200
Message-Id: <DL9EN09H9IUW.12C25XA0HVUXE@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>,
 "Vivekananda Dayananda" <vivekana@amd.com>, "Cory Keitz"
 <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>

Hi Dumitru,

Went through v16 and checked points I raised on v15.
All of them have been addressed.

Kind Regards,
Artur Andrzejczak

