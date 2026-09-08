Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91542534449
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869592; cv=pass; b=egYCVie+ENwl5TJC0+X4/ltt3pyKyXkgQc0m/7ovbnPxcHKSxzUNcpSkUHXOf09n0LtQemAd7vRfrLBiQz0zzL/BYpZherLgpfj+4aziMqfB6/1Da5U7wI8OYvjNsv3ci1Fv5PXBAKYkhSPcIQt2CQgl3ykvmwj3OvU++GBntyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869592; c=relaxed/simple;
	bh=t1pqubOKg46YMx27dxbs9Dzacr4ABPXV3Ceh5qC8XJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BetVk9r/96WpsQgEOyAUEbBDlOyFCF0vW2r3aFQmgL8PKbOZn3BfiGJ/6pgV8Yem+d+VgQnyByO+TqV/qJmgz/ZU1pDAl3O5hUAU4iE1/hNwtiAXyyUf307GOr3zvBhNpuCAeY4ZAqsznksa/MX6XfAeeYHjSi81tZuAUriLrFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=MiM0AXPL; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="MiM0AXPL"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hfN9l5Xz6z49Q5S;
	Tue, 08 Sep 2026 15:12:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788869563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=89jBr99qRE0q7H1nc4DTqayX4VkgoDHOD0QzrKCQa78=;
	b=MiM0AXPLslTBX4PitCn4/qslb/OfC/wnNyXfJKpV07/eLXGoML7SgL573EIEki981JWPG9
	9CztigTE4Zvyrs3/eKVGrddaJltx6rY/skTJkJ1t2tueKtjMsSuH7BNrdD9dHUEWtbjM2H
	PbSMVucSZQkUsICnc5SkdUuRgiH+2fZ/rCQfQeM6YZBl9Qs943zTNjNv7Q5HhihJAm/ZbH
	wOXDZY2WuSHuQN33RzhC14+aLCjllVLn9adRkpO3dz6EHkIKh2vBRaY1NLFElzZG3Jw63C
	q6Jo+dNojTx7MpXJG19ohZwVmrKN5wbRrktM9XND5B7AFPlzxkel747UBpYWZw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788869563;
	b=HY3TqM0kKGiWETysdfaPp3UOa2D1lgjN5CfRA2+XWnSfHtMQws7243wT+T2Ylqq4MuONVn
	X5vLRjbLqlQsUOpsbnuJJYW5sIKvDUvkiEk5i1C0RqszFbDCzXYkw8fGdZClqNaNk0ZYap
	d8PnVFbtjEu9TqbEs0NpJ6ff09uaWJ2JqjvwAZxpaqfvvoNs2TGqINYz+UK/qdqK1jSadT
	FyEWP9tOSFfhKx94FbnDGLpGscfafGHkhkQomafkz1eF/dArys1WGDdf9isbNuUQccgSfm
	Hif/llB4b2ia3/7HqrY8LMl5u+IfQOcv0eKKJOm9Kacgdg7id6jmpA+QlTpf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788869563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=89jBr99qRE0q7H1nc4DTqayX4VkgoDHOD0QzrKCQa78=;
	b=u2RraCf8KDSNdFnbJJ6TSgP0W8hTzbM0l+Mzing5ygU8rz9x2u4IPoPwX8jz+jsNb3CM8Y
	mv/h3SGd8LFSVg9uLYhpk6+zipeDRx0eAprwnxVmDL/L8rVb5M3SO6fdGbE8sC/zAh36Tn
	tb4qbh4RgIwClRqs4NGSJnyXVuH1whEOY09i+o0BX5T3uN5vrCJMXgCuaIjViMB29D5NQO
	iEZXGq1Fengsszr70Qt/NHuAu0A/qofrySxKCcxEPeR/nm4IMPvs7VIQe6yEgrZmlCUDAt
	xpJSdftx4XqcfiPHnc2Ghwhb78cPpWDhB/hWsqyLUv5Gho7FJxCCdGzN7+KWZQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2171F634C57;
	Tue, 08 Sep 2026 15:12:42 +0300 (EEST)
Date: Tue, 8 Sep 2026 15:12:42 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Lars Ljung <lars@matholka.se>
Subject: Re: [PATCH] media: usb: em28xx: check if vbi is supported before
 calling, vb2_queue_init
Message-ID: <ap_7uv05fa4fTk92@valkosipuli.retiisi.eu>
References: <3e01154b-ab4d-4cb3-90d7-a5dce4e5b2c4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e01154b-ab4d-4cb3-90d7-a5dce4e5b2c4@kernel.org>

On Fri, Jul 31, 2026 at 12:36:52PM +0200, Hans Verkuil wrote:
> If the device does not support vbi, then the vbi queue is still
> initialized with vb2_queue_init(), which fails with a WARNing because
> the q->lock pointer is never set.
> 
> Only call vb2_queue_init for the vbi queue if vbi is actually
> supported.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Reported-by: Lars Ljung <lars@matholka.se>
> Closes: https://lore.kernel.org/linux-media/8ede91cc-b505-458a-94ef-fb02270f9701@matholka.se/T/#u

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
