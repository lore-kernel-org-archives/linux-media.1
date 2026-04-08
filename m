Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99D17A300
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 07:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633447; cv=none; b=RZZj9a08AKU0pDupgcylE4Ny8tIAh/xkGBvkz4KcyVVEf1Ce61Jk9R5/3VgsMQS5Nj8pwh7thhAGE5F/MX1YQ2jdqBaoDswx2gEcgot0+3y0LElMmSolRV+y7e/zkR9n8Fenc83p+UFIdRwGq3IDf7smUa2b0KNcWa2dGVwy2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633447; c=relaxed/simple;
	bh=iLk+q0vpMWfT6+qo8TVp91yuVkQz2xzSQVaz3NLTlng=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=PMvqG7g8+Rf6dWnyxbKgSq6J1hYQGzODWIpZAyNEtbKJFTF6E9QcVY5bIIXgBolry4AcJeVI5C4/VlN1Apyz1VLo++Sbuo+e8cQFypZRjip1dS6Pl95PQM9b4eddj/zFMud5DZQcnRhHClJJ/mDU8pkXLFhbPG5ARIMdo0OqD2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=riXpThm5; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="riXpThm5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iLk+q0vpMWfT6+qo8TVp91yuVkQz2xzSQVaz3NLTlng=; b=riXpThm5uD2KqCxMO1vA9zeSrv
	UY4UgYkILoF0TQISXU/uR8grmZUHZzYfz7K6eg8weu4r+cHd1D5fg/NTlJ6WsG5YWuKGM3Ino3EIT
	WZz9G6DATOgOsMTZvhx/MJmgR9jDefeBPKUEM13ospy8KEW0yPo8X+f5hOrZp7Jkpu3EnI2yOdn22
	PkqXj3CQKeWiwrRWE2GmNyQH8nsmzKIS4w9h+WgvUUA4qcTX17qRYZu6ACDOJjt3/5dVuhJ46mypL
	WNJj+ycK/5w1klRaD2ZLN3mS88Mw1YL54r9+Rns59KNVwTLVBE5CoU8McpAo9I1d4VkKVJkWOPRxM
	wM8L9flw==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANN7-00067F-3B;
	Wed, 08 Apr 2026 07:30:46 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wANN7-0002Vg-2f;
	Wed, 08 Apr 2026 07:30:45 +0000
Date: Wed, 8 Apr 2026 07:30:45 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <391484028.3.1775633445825@builder.linuxtv.org>
In-Reply-To: <1429263566.2.1775633396921@builder.linuxtv.org>
References: <1429263566.2.1775633396921@builder.linuxtv.org>
Subject: Build failed in Jenkins: edid-decode #340
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: edid-decode
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/edid-decode/340/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as Mauro Carvalho Chehab
Building remotely on slave2 in workspace <https://builder.linuxtv.org/job/edid-decode/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/edid-decode/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/edid-decode.git # timeout=10
Fetching upstream changes from git://linuxtv.org/edid-decode.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.5'
 > git fetch --tags --force --progress -- git://linuxtv.org/edid-decode.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision cd4bba870bee3775d2bc811d1089fb3206437176 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f cd4bba870bee3775d2bc811d1089fb3206437176 # timeout=10
Commit message: "edid-decode: moved to v4l-utils, remove all code and update README"
 > git rev-list --no-walk cd4bba870bee3775d2bc811d1089fb3206437176 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse cd4bba870bee3775d2bc811d1089fb3206437176^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/edid-decode.git'
[GitCheckoutListener] Found previous build 'edid-decode #339' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'cd4bba8'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'cd4bba8' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@61859466'
[edid-decode] $ /bin/sh -xe /tmp/jenkins6407447495748234959.sh
+ meson setup build

ERROR: Neither directory contains a build file meson.build.
Build step 'Execute shell' marked build as failure
