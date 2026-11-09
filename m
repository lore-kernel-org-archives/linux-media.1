Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.211.166.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794195153;
	b=0OI9FHQvQ8L9hvXFtOA/JgfxUCuKwi2hPogk5yNaCxciiyH2cA6Cx7eJHThTHXtphyLc
	 S1WcUDtWKmYrGjiu1cUiVPvtZYHZGsIu76YFpjwdFO823rgWeFHKhgPdRcpl1m5WlBPRM
	 xYLTrpG9GT4C/9RkXzYCn/O/A/hCoCR7m5WgEVrmrnxIEQIZa65HPleJvObj5JLV9Pc8T
	 yQXhcIISPbT12xpuh2C+jc4uMJzvcn67BIwDOHb+HT56p3DCq6UyGfwnrJqPNjeRnRYaz
	 4zKj35x8n7gVXEzdJC+PS6YAuh/LbkC5RQ2Q0T13rZgnW6jrzo19KpglOoN1QJhCfBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794195153;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:To:Date:Message-ID;
	bh=J5OKBNEjfxPx06irkBZ+brTM4CrFfYQeRfX7O6LcK08=;
	b=uf0TizBxCyXRuWoyPE03M1IyB6L42dUCj5wA2IqdAYBI9VUFgTvbA0fLYkfyoQUNivIM
	 YofygHxP5OI2rxAFQgOetImmAJgRNX8YJI9P9OiPfNCaw4vgZnQmeQnVRRlQa8fUllsr4
	 KNXXx3iaA9w0zGOy3r2LVv7C3iB5ivyOYxt9pGm+RZCVUwPrS/gbrfIHnGo49/xQZWX02
	 0H9mKXHjyTrO1U4ekDLQxX+GjzULD8rreFWPgqp/SuSfkJiO7KFYrhd4SMdTLitPrbU9R
	 +/tt2saajv5pBQE8kOQQFqRCYcdC8IaFML0Rx+IknlUYGH+LK9flt66glS3/fsx4xtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxtv.org;
	spf=pass smtp.mailfrom=linuxtv.org;
	dkim=pass header.d=linuxtv.org header.i=@linuxtv.org header.a=rsa-sha256 header.s=s1 header.b="Pjv5VLw/";
	arc=none smtp.remote-ip=140.211.166.241
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96763606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 03:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96763606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linuxtv.org header.i=@linuxtv.org header.a=rsa-sha256 header.s=s1 header.b=Pjv5VLw/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Message-ID:Date:To:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J5OKBNEjfxPx06irkBZ+brTM4CrFfYQeRfX7O6LcK08=; b=Pjv5VLw/OGAZzbLtz0nTNKeKb9
	MhKlob4qIUMj5Ew9GFSfXwDv1LxA4w466P9xu4Kik3h9MEyGsBzOOm8yenH0/yK0LkZV1JDOUc386
	tFdty/o5DvaOhnm/2bCSyTROJFXNVokCM72GbA2UKHxnNgr8cE7EiiXZBPU6kHhYKhK9MZ+liKLNb
	rhTZL4OvN6G4SbS11XWDgzGdGnPdTU/5RdG2nLrh1s/Zh8RHYacPDO+LiYz1WAdapb2uqZ4UCl9OY
	Hm++EcTqX9ccwV0w/TIw/zLh9pedOg3djSIfVP+qjOCE2T/xfUBd8iDaKAcp+uaTv18ZFd6iM6TDD
	S2rwSCqQ==;
Received: from localhost ([127.0.0.1] helo=linuxtv.org)
	by linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <patchwork@linuxtv.org>)
	id 1xQG1L-0007V9-1z
	for linux-media@vger.kernel.org;
	Mon, 09 Nov 2026 03:26:11 +0000
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Patchwork opt-out request
From: Patchwork <patchwork@linuxtv.org>
To: linux-media@vger.kernel.org
Date: Mon, 09 Nov 2026 03:26:11 -0000
Message-ID: <179419477161.28143.4640085497817406476@linuxtv.org>

Hi,

This email is to confirm that you would like to opt-out from all email
from the Patchwork system at patchwork.linuxtv.org.

To complete the opt-out process, visit:

 http://patchwork.linuxtv.org/confirm/2152c0cc6dcfbe78bc3da903f2f64c8cf4bac52f/

If you didn't request this opt-out, you don't need to do anything.

Happy patchworking.
