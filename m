Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9301A9F96;
	Thu, 23 Jul 2026 00:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784767633; cv=none; b=ERbG5Q4AgycBCv1aq0GanFT9t5EbQNY9IB2nfOJPHfdzWS+cVIrotN6+odxg7z65P/TyjZunFqJpv5GYuz/Xf7OzMBVoIHSxtdBKSmPnaPktFJZHiYjKK+m3w+HNDYoCKCQluvokZS1HnFhU88f6w5Dt/YGu+Jfy526MNsZy6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784767633; c=relaxed/simple;
	bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y/11Q/hCVbKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PnMWVMp85bwBhFRYio/88baqGbRd15Nemt6Ub4ulDSUz9XKb13gLNaP73hxOSuTBlyn8oanK+mk0Pnqtrc0mEdYl0UHNEUJVd5g3xsPlpyz3XcKXvQKGVPV524aRNUeEPLnic6Kiq6jhwtGpVJc64BgklvAB36LhESevBv+LW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=ot7y1o/D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=deHdj7UV; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="ot7y1o/D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="deHdj7UV"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 688C6130030A;
	Wed, 22 Jul 2026 20:47:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 20:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1784767631; x=1784771231; bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y
	/11Q/hCVbKw=; b=ot7y1o/D+RXb36r9Rv++/f4Ga3sHXWhRCmIotuGKheuwLp2M
	qReB3onN5MaJb7qGpgheAOLvr/WAsd9UurxWze4FR2iiXYSgZQujt8T5OKD0Zmj0
	ooMbWG2HDbpVENF1POXvGQXn9IYvCQ1X2rfnzfkPAV1FcqqLxe9BhQ2+l3SHvPcl
	Hqx4T7Ci8oDGMhszhV119k9r0+2hOVVZh0/IsNeFbqttmpymXjTnIt4LI5qEQ4aQ
	2CqQU4yLQmGcIArhC4g3+FjlCJeMpYbvX9DfpRyKBpH0C1L/1jrUqtWZB73Ts1dT
	TY79CJiGIzTddyyvoCfpfb5TzmKWgbrK6Qa+Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784767631; x=
	1784771231; bh=jWaMVB217J5XkLdEgIoIU4LaUd29zl7Y/11Q/hCVbKw=; b=d
	eHdj7UVn/GR7HRsgzVmO5Zzi1k+NCZIae+M7pvmPcsgU2z5lWEj0kin9tjDiEZ3X
	qilUZtKoPtexK/4Ss8Vw+Y1JpEknxxpiUcYa/PFib8hID2vXn8iEYNooyJJZpsXx
	uknjSf8IYBtK+sKvw3+jYnHo0trPW8e/0ac+HSZjS0NoT/YB86phfgR40qxObMv8
	VlZTEAAK1V225hNguPrdsAtyaThfBsHSzOnNTfd8Hx0/LuwqpVidhZBKF+KY1QVB
	tNPmvZj2tQR3G1Rj9cCsgccXWtqJS1l40vJlYMy0W17dRNpU4kHA2qkFu60ihc71
	3y6ZbUi/tXuTujqh+tOfA==
X-ME-Sender: <xms:jmRharGreDltf4ySxnmoGx0o7IxMp_Pj6YcApo-BVtFQJbgsvt27lw>
    <xme:jmRhanxENcOdtvGDMnWT4u51XzM0HueXro5Idgpa4wlcZj6vZhHooK83wPgJrfEV5
    --Ha1aLEBlErP7_2zRFdb_BnhFzu3aKBrYuMOmPuExOjyXCAPSDFQ>
X-ME-Received: <xmr:jmRhauOVsDc6A3KYpbqU9Sz5bPGbvdrxShT-K55ffaywpA3Gr2bZFeBFRcKaAHDtzKTvTzrOGi9JoRVXukXyiEPhAHX48CPZ9E3HjCabvUNn>
X-ME-Proxy-Cause: dmFkZTGT6pDE7ROr/Hozct7PtmKb1bP65C0DyW42xkiGcmM5l/vHrs8c3kaqSSXYBT1BMw
    +Y4JWWHcwHwE/gXFX+GJTs88UN1YpGvrwXyFKNWZMRhUfiQA+Ug/Cav2dB1SgUYDMC2qEh
    8shynik/cfqaXTdqMsuqB2CcsGWg9s26iWrxKQZDi+fuzL33he4wZ4J8D+t7na5WLkqjNr
    mnQq25aDF1mexaAk+z3OsDBu8G59fSjlk6/AgneWO9Sbz+Acf9zeDwWga7Ecwo2Y6JQzrM
    GNWdJKHL0nLwPAixd9uDz7a6pXlSCuuB7+5t8moaXxbEMNnF7NEkejALwTyaVs44sI2EI0
    jckNz6oB9oAVtgT+v1jFEJAbkvlqpuDaXwwlIZxS6oUU04/u3LEg7oOoQnSkjtf5GzMbrh
    hRpYt6qmWTsFCx1TKE+aKs6yiX21uJtEw0lH0OqDhjLDGhVrZwgubZ2OnXLDEtdRwvTTF3
    HDlyklmNvM3OTegF9szpMXLOJpTgTpFd1DbXruDO+wrJmZXBpHAGjNOLW0g5j+KaWj4V4l
    6YQN1BTNMGXUz5N7wlIIIG6olFv4jHckmnEOGJ5BJl2FJ/hkmpnBgnLAkeewTkJIxIUG7i
    RpDaDVgs9upxMvhxnVzZveeK6gjy7rbNQn7zusgba4+Iir6Ohg5lizrYr/kA
X-ME-Proxy: <xmx:jmRhatY2yJczDob8igYb7TIz3YmghpeKlhvdYBeZoZvLzublgIg1EQ>
    <xmx:j2RhalANrwOkV894SLBbQ8VHqoN1uxOfMFbc-_xk_0RqLDykHjKHyg>
    <xmx:j2RharFa0NNZIbJkN7Za0_4xwraybIfXlpzr8axafra_5QtUYt2oEQ>
    <xmx:j2RhagOuCJW9Oj9I1VPRlo4CN7RyzFFZwxxOogmOQTCc_W1s8a6hyA>
    <xmx:j2RhauHBJWdSk1q4lvxDQ6zm8HC_JuVT3HGD3pN2SW4yltFU3pKaEUTO>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 20:47:05 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de
Cc: mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com,
	detlev.casanova@collabora.com,
	ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder driver for RK3576
Date: Thu, 23 Jul 2026 12:47:02 +1200
Message-ID: <20260723004702.2075313-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3096814.BaHzMo0RvP@diego>
References: <20260722073417.2064667-1-gahing@gahingwoo.com> <20260722073417.2064667-3-gahing@gahingwoo.com> <3096814.BaHzMo0RvP@diego>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 22 Jul 2026 12:00:27 +0200, Heiko Stübner wrote:
> At least the comment and from a casual look also the code get this
> backwards. The idea is to explicitly _not_ expose multiple video
> devices.
> [...]
> Any (future) scheduling should happen inside the driver, and not get
> offloaded onto _every_ userspace application individually.

You're right, thanks. Exposing rkvenc0/rkvenc1 as two nodes and pushing
the core choice onto userspace is backwards; rkvdec_disable_multicore()
is the pattern to follow -- probe only the first core, keep any
multi-core scheduling inside the driver. I'll fix that.

Depending on where the interface discussion in the 0/3 thread lands
(Nicolas is pointing at a lower-level stateless / Vulkan-Video direction
that Detlev is already building for RK3588) this driver's shape may
change quite a bit, but the "don't offload core selection to userspace"
point holds either way.

Thanks,
Jiaxing
