Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A861F936
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775944602; cv=none; b=vGmiXMGu3kbd+ld9RU0xNZj11YwDKi/NWzOwWajg5FOOdbDAWQOLhlygXP+oJHFc5n29cMF1h8avxVV1em2vPjS/1rNygrq/ZXvW8GZNfiAX3I7CuQuSOOOXE4h7SSSl+StW5r77uI++lSlSBkBMFVQwYX3jctl4GOhS+JiTKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775944602; c=relaxed/simple;
	bh=ytkQBdiYwFF+2eaGgoc523RW4XbtoR7eE3IO5Khss4M=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jbtckLY7bfgjsBir359af38zkSgdWKXZrsGjK7mYny357f+as5MBvsZz6i9pJhZCHftQSaEWnLPhczyy45m1e10UG6pNB3fQHFG60SqsTCeCJ4K9Qs49pcXrNBgGXCvewbNg1IK68VSUGoHQsLT/EUrFxvjRu8wZayGzsrAZ1Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=bJxn1WJG; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="bJxn1WJG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ytkQBdiYwFF+2eaGgoc523RW4XbtoR7eE3IO5Khss4M=; b=bJxn1WJGtGAKH2UwXVfkdLahdV
	T5RXjeunxQAGNTGGtf6qX+bfkciD/c4HaNPWy+cHIpwuCr2c9246r91ZW+hypCxFffeYRR6H4GUdp
	khmjoME97mIIJAjIf8I1mxJSDsHRE8Dwn/zaVf7fEYrlCFRTX+vTwy1lcv47qqtJcXCGih3uUvNz6
	bSluhYYaiuAEoepHlZnVIelbL0LqvBmvgTDClVk4xAvWfCZD/gb+KVIYRmZMIRmnl2JffBW/bOd++
	F06ogQihz36n+5pPfq08QuSOnT4uDXohM4Ex51JfkW0TVKwncBc9NjznLutQW7IfUv8yfI+zPpga6
	lfwXBGHw==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgJk-0002Eb-2C;
	Sat, 11 Apr 2026 21:56:40 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wBgJk-000hAM-24;
	Sat, 11 Apr 2026 21:56:40 +0000
Date: Sat, 11 Apr 2026 21:56:40 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1201123717.2.1775944600638@builder.linuxtv.org>
In-Reply-To: <181607545.1.1775906070029@builder.linuxtv.org>
References: <181607545.1.1775906070029@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #42
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated

See <https://builder.linuxtv.org/job/dtv-scan-tables/42/display/redirect>

Changes:


------------------------------------------
Started by user Mauro Carvalho Chehab
Running as Mauro Carvalho Chehab
Building remotely on slave1 in workspace <https://builder.linuxtv.org/job/dtv-scan-tables/ws/>
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir <https://builder.linuxtv.org/job/dtv-scan-tables/ws/.git> # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git://linuxtv.org/dtv-scan-tables.git # timeout=10
Fetching upstream changes from git://linuxtv.org/dtv-scan-tables.git
 > git --version # timeout=10
 > git --version # 'git version 2.39.5'
 > git fetch --tags --force --progress -- git://linuxtv.org/dtv-scan-tables.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision be35975ac877ba020aaf1df4e0e352c9d11ffcf1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f be35975ac877ba020aaf1df4e0e352c9d11ffcf1 # timeout=10
Commit message: "Update satellite lists from Lyngsat and KingOfSat"
 > git rev-list --no-walk be35975ac877ba020aaf1df4e0e352c9d11ffcf1 # timeout=10
The recommended git tool is: NONE
No credentials specified
 > git rev-parse be35975ac877ba020aaf1df4e0e352c9d11ffcf1^{commit} # timeout=10
The recommended git tool is: NONE
No credentials specified
[GitCheckoutListener] Recording commits of 'git git://linuxtv.org/dtv-scan-tables.git'
[GitCheckoutListener] Found previous build 'dtv-scan-tables #41' that contains recorded Git commits
[GitCheckoutListener] -> Starting recording of new commits since 'be35975'
[GitCheckoutListener] -> Single parent commit found - branch is already descendant of target branch head
[GitCheckoutListener] -> Using head commit 'be35975' as starting point
[GitCheckoutListener] -> No new commits found
[GitCheckoutListener] -> Git commit decorator could not be created for SCM 'hudson.plugins.git.GitSCM@12096e71'
[dtv-scan-tables] $ /bin/sh -xe /tmp/jenkins7549330139950608287.sh
+ git clone git://linuxtv.org/v4l-utils.git v4l-utils
fatal: destination path 'v4l-utils' already exists and is not an empty directory.
Build step 'Execute shell' marked build as failure
