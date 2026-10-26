Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035190;
	b=IG+h76Wq8VIxSQ9sFOD2CCH4NucvkPfQvhMxHu7DcPsdvKCSC/zptsHELVB3GCkXJjhi
	 +dcJn2yLA/jsF6TgG3gvRfIBhfW4gFE24i1qNaju9yKzRWsdJbFh3SMT+R7x3kjgSqOEg
	 2FBI+pG6QeqD5z25fAEuDmv5qhj4U4HyLD7MP9sZIP+xPeGSjI59a76zm5PJxUU5zDt1C
	 KmEVmSi5bF0MUHfVthM1HAzqtXdMoPqN5ojWKbT3KC5/byytKmNBLuqSVIY22m8RWlXP5
	 L/zvcLWqKfC+SXheaLLUQOu4CxnHlHAXP3UgD9Ai4X+CDl+ok/IZlNXoEzfiUgNJAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=koCbTNcUl+ZNdwjsfNR6czB5FemJuGZPNPWXgi3kS1k=;
	b=Ea1AcJZKaS/UGm+2j3COk9TCNDl63BbmZPoENosUNDYDYRqWXuWznr7APbXiO9Rbxh71
	 h9nk9c7NBQorVy4R2eft3CcQ+ItU1Az44OuzXyF6hK0mUPpmiYWLLFC6jn4fOYWPt89Sk
	 frCLHgCrmjBFXUjJ4abbnCRrK535NacfXVxBuoDvgKXyV8Pq7UF6rETClm3H4/BIKH8UA
	 uUyPShHrn2cXMUDMQzAwR1hmpJYGwWvL1iQwczuVWVhjbGidyj1qx4Jf7o24E89AYIhJu
	 ++V5Zt+JHQRF75rsaEcs73pM2EJ+6uxkTyjIC3Gie4AppCgCwJAb98vkkvGGHs+c60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+59J8ce;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB1F606A31E
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 17:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB1F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V+59J8ce
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso32998435e9.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793035189; x=1793639989; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=koCbTNcUl+ZNdwjsfNR6czB5FemJuGZPNPWXgi3kS1k=;
        b=V+59J8ceSVNOyi2rHnZVND/9LVDPC1N06bn0O/b0vCuCR40osy76phMuKzUz85m6n4
         W7LXCtwJwvUYhBONr83H1Qwmuz1Uy/x4EifuUKw8um/IMMVBfeWBPEbuj7OG4dNEGTrF
         c3v/WcUCoxAqQjNI84Qa9Pv62xDktD4w7NlFrckyiefxeiI2S0B6XpbAWq4VWpsJXyMh
         12Ex2xCQ8bb39d33psmQwcp6P8CeJBKzjB3SUPSH+gxu5dmwINB7JBT0q0HPhiAPTjRG
         evOJUAhMQLC63fBvczv87742q1NUvz8QnHr4YaNoiVMs41eP02+QXXlyMrCvvbQYk02d
         vBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035189; x=1793639989;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koCbTNcUl+ZNdwjsfNR6czB5FemJuGZPNPWXgi3kS1k=;
        b=e9rFYvhNjsPF7NrTf8z9wf9z8NLTUXYsrUGt+zIHMHj/oKlEEk14z7n4QIJ6rp5adm
         bthZFjN54REYMl/lKbnpoxMzNqcXhpTuoC6Vbl2Yecnfh+QZf6zPb/wHbuxXq7FknPMH
         GMzj/qSgSo5wMMqUljYLXTDmXJITtsRIQ4MSiVOrXKtZrT0Y1xbGq7r426g0F5SC2Ke2
         CgKQmmU74YbRGsjMcjRhV/IGaCMjpZmvQQuEAh0be+89ZLr4mUB0Cmw3SdD66doZDblM
         eNKzGYfbLGRZ8HiMi3qV7GsEwCAZP/7kHwm6cVwnH2wCXaLPSfWkJTEprx8mswNRNr/l
         PF0w==
X-Forwarded-Encrypted: i=1; AKwUvBylFZoweLEqXhJzS38WfICZRhlwjv36uJ554WpH+bmK0KoUHschYu+WU1Vq5uH7Dvj0W19dd65eu2bS7g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHXlujf3qDYE9jUm5tWjdMVZ4OJ6/jE0d+BiDknAQwgI1iSmsK
	MPLKRMvy87IwZ37xbAjsSz4uB3Qo2Ra+v324iPmOhVshsmYjhuca4TaYN30ezrVeyQ==
X-Gm-Gg: AYBFou0sxIHtDFwFx1O7jzEzMp8xKBf0TGvtNN2NG6jX4iprI3EEQxrWhDhhuCWMWM6
	5z2x4D1cTrZWHuAJk1w/JUHkdykf4OWPgeE7Hrt6T6gZ9lYIfLH6k8MVTpFTqe3EmTmD0flg12H
	YTkHzAETSjaV/KatI5BK4jV3uftkvjbf2x4Jtq/oixyEk445d6gXm7EkK4TIPI5TnV0/0bO2Q6f
	TJDpTE9l5Rza8Zi3WrUf8EigKWaHDKW/dSJf5/xfFV7zojccC2TlRzn4R2iuf3OkxVTjNLrKTgC
	Zgc/JHr99adzvbwaG2XZ3QaIoPNM/RXbpWe+ln5/nVHLm1oV3goterQHNbaE9NAjRbvjWdYZ5vz
	21ExP6RGzdPdIwOdgzY8ze6oZpAEkWF4DtrX8Vqvhl4gV6V7H1P8Z7SZEeIAW76XEnoHNzfW/IO
	lj7EQ2UHRHTbhDvcF+Y7rsQA8D0o2Fni883zuVFXvGKioKXcYOX6oncudsEpz3QEUKfOhZdBexZ
	e321K1gdHOrl9jnrpCXx0ml2veGek25D2Jwywgu7ZWMIodU/mq+4UUkIdQLxQZ2n14swNKYevs7
	ClNabmPnvBUqfIHQQNmwNXzNGmkvDZgt/WM3xqY=
X-Received: by 2002:a05:600c:a106:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4a35aea23edmr104749785e9.9.1793035188565;
        Mon, 26 Oct 2026 10:19:48 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm168195035e9.2.2026.10.26.10.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:19:47 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: koreev.r@gmail.com, fernandorimoli11@gmail.com
Cc: sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com,
 hansg@kernel.org, andriy.shevchenko@linux.intel.com, rillian.grant@gmail.com,
 lsa.uz@pm.me, linux-media@vger.kernel.org
Subject: Re: media: ipu-bridge: lifetime of retained software-node properties
Date: Mon, 26 Oct 2026 18:19:45 +0100
Message-ID: <179303518584.774397.17279190841735842653@gmail.com>
In-Reply-To: <20261026111108.34186-1-fernandorimoli11@gmail.com>
References: <20261026091252.676350-1-koreev.r@gmail.com>
 <20261026111108.34186-1-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 26, 2026 at 11:11:06AM +0000, Fernando Rimoli wrote:
> As far as I can see, with those two gone nothing in the graph points
> into the module any more and every other name and value is already a
> per-sensor copy.

I checked that instead of just agreeing with it, since Ruslan and Sergey
are both about to add properties and it is a bad thing to get wrong. It
holds, with one trap worth recording.

Against media/next with v5 applied, in ipu-bridge.c:

- every registered node's .name is a per-sensor or per-bridge char
  array: sensor->name, sensor->ivsc_name, sensor->node_names.*, and
  bridge->ipu_node_name for the IPU HID node itself;
- every property name comes from sensor->prop_names, a struct
  ipu_property_names of char arrays copied per sensor;
- every property value is an inline scalar, bridge->data_lanes,
  sensor->link_freqs (what 1/2 changes) or one of the sensor->*_ref
  arrays;
- there is no PROPERTY_ENTRY_STRING anywhere, so no property holds a
  string pointer as a value;
- .properties and .parent all point inside struct ipu_sensor or at
  bridge->ipu_hid_node.

All of that lives in the struct ipu_bridge that ipu_bridge_init()
allocates and then deliberately never frees: kfree(bridge) appears only
on the error paths, and there is no module_exit() or remove hook. So the
precise statement is not that nothing points into the module, but that
everything points into a heap allocation that outlives it. That is also
the answer to where a new name or value should go.

The trap: sensor->vcm_type still points into ipu_vcm_types[], which is
module rodata, and it survives in the retained struct. It is not a bug
today, because it is only read during init, and the one thing that runs
later -- ipu_bridge_instantiate_vcm() -- takes the VCM type from "%pfwP"
of the fwnode, that is from sensor->node_names.vcm, not from vcm_type.
But it is a dangling pointer sitting in a struct that outlives the
module, and the next person to read it from a rebind path will not
expect that. Either a comment or copying it like everything else would
close it.

If it helps: I have a Surface Pro 7+ (IPU6 Tiger Lake, three sensors on
the bridge) here for a few more days and can exercise the unload and the
PCI remove/rescan paths on it, which is where all of this actually
bites. Ask while it is still here.

D. Manresa

(Written with AI assistance, directed and reviewed by me. Resent as
plain text: the first copy was rejected by the list for carrying an HTML
part, so it reached the Cc list but never the archive. Apologies to
those getting it twice.)
