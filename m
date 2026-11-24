Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.37.160.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520884;
	b=A5MeSuBgGyHeKHiQo1NZJuzfET7hIL0lNidA90jJdQ8/LxEOCXNEOcV3VgHmcCam/x7S
	 w29NgXcsakA4x2eZwlbNBvTkWLO6yJmKDJX0v9ubu2pY8M8KO1ThASBFRAmvqnP4ypCXQ
	 fB7Pu/BsTGMw0cLQvCvIQIrNNHA/5PXWKBv3yMCppwTTWxCMwxByZP8Py/6eORATcm9Xr
	 LAHAJQSUyB5xXFifnQINhbbWdQyX/f26D4ZrpfQxcITCePbjPurYr/VQqRvSL/uaKkuGb
	 V/X6Ucv/X0qspSlj9dwyXY9lGx2yqeowUdG6LwQulPGaXi+Q58cgFbMWynqNcZ9f9rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520884;
	h=DMARC-Filter:DKIM-Signature:Received:MIME-Version:Date:From:To:
	 Subject:Message-ID:X-Sender:Content-Type:Content-Transfer-Encoding:
	 Sender;
	bh=7jqnNayOlZVScK3fMknBiwZmSXs78gMepzJkxenu5Vc=;
	b=2a1wbMPlBKXjcyH/59oZUjpn9MNKexjGN5gpiLnncWgquvwA9sO/XjR449dGvhxywum7
	 gfUke68edqk5GN0lZ3cxn6cv76vizqUDSNBsG36x8lA1Qg1HAPlAbXfJj78Q6KfWY9OC6
	 ZFqkZSxtsnqJ4mauZOmKOvkQmi/8EsU1JAER6vLXXksNic54EweJhRtwRe5pvtvIRbfEb
	 4eZXp3zgSNmkkUNSsqzSFNI3PrfBcklgMGF65rxQATJZPnmAuhiWecZKELFB72XQRH8e8
	 5rZxWMrJYQPfFaq0wBFhngn1AYC2IwBc0pGd2CU3brQIrfVdcxqHWmQH6CJ/4e80dTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codethink.co.uk;
	spf=pass smtp.mailfrom=codethink.co.uk;
	dkim=pass header.d=codethink.co.uk header.i=@codethink.co.uk header.a=rsa-sha256 header.s=imap6-20260915 header.b=OaVrMikv;
	arc=none smtp.remote-ip=46.37.160.117
Received: from imap6.mcr3.codethink.co.uk (imap6.mcr3.codethink.co.uk [46.37.160.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3F606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codethink.co.uk header.i=@codethink.co.uk header.a=rsa-sha256 header.s=imap6-20260915 header.b=OaVrMikv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap6-20260915; h=Sender:Content-Transfer-Encoding:
	Message-ID:Subject:To:From:Date:MIME-Version:Reply-To:Cc:In-Reply-To:
	References; bh=7jqnNayOlZVScK3fMknBiwZmSXs78gMepzJkxenu5Vc=; b=OaVrMikv+6kwWE
	oWIYaQsq5TWCFsOAY++IkTnxtkDNd96DOathDu6afZhG5KAj/2ghKhGgr7YDtNKo7qULH9FmsG2xq
	7dmuWLEBreCCrLWezYlk5FHIhSHQIYcOHog8m5lxRukA8eSfADE52r14K/2+pZ+gOBXLn5S3mIrRa
	VRoaWJaMPXpHA4u24JkoP2+zE1jRHWabHlMAx6koM1w2iarEUhbZgW5yLetpFAI3rG2q2HR1QSnFN
	iGxSCNA4p/jFrRoK9XNkUK6aPvToi6vLlvjStwUsjvnCW6DU3B3vsvu1lWtJZpnX8zk4cugCsoXge
	H6O3dHJKTfqbmK9DTu1w==;
Received: from 46.37.160.103.srvlist.ukfast.net ([46.37.160.103] helo=webmail.codethink.co.uk)
	by imap6.mcr3.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1xVp06-008Tkc-M2
	for <linux-media@vger.kernel.org> ; Tue, 24 Nov 2026 11:47:54 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 11:47:54 +0000
From: paulo.constantino@codethink.co.uk
To: linux-media@vger.kernel.org
Subject: [PATCH v4l-utils] doc: Make Doxygen documentation reproducible
Message-ID: <3dbb643b5fea57a3f0f12448db24ff25@codethink.co.uk>
X-Sender: paulo.constantino@codethink.co.uk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Sender: paulo.constantino@codethink.co.uk

Enable sorting of brief documentation by fully qualified names.

Doxygen can generate group members in a nondeterministic order,
particularly for nested and anonymous structures with similar names.
This changes the generated HTML navigation indexes between builds.

Enabling SORT_BRIEF_DOCS and SORT_BY_SCOPE_NAME stabilizes the
ordering without removing any documentation.

Tested with freedesktop-sdk on aarch64:
- release/26.08: 30 consecutive reproducible builds
- master: 20 consecutive reproducible builds

Signed-off-by: Paulo Constantino <pauloconstantino@codethink.co.uk>
---
  doc/Doxyfile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/Doxyfile.in b/doc/Doxyfile.in
index b7a76cb1..ac6ef62b 100644
--- a/doc/Doxyfile.in
+++ b/doc/Doxyfile.in
@@ -528,7 +528,7 @@ SORT_MEMBER_DOCS       = YES
  # this will also influence the order of the classes in the class list.
  # The default value is: NO.

-SORT_BRIEF_DOCS        = NO
+SORT_BRIEF_DOCS        = YES

  # If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will 
sort the
  # (brief and detailed) documentation of class members so that 
constructors and
@@ -557,7 +557,7 @@ SORT_GROUP_NAMES       = NO
  # list.
  # The default value is: NO.

-SORT_BY_SCOPE_NAME     = NO
+SORT_BY_SCOPE_NAME     = YES

  # If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to 
do proper
  # type resolution of all parameters of a function it will reject a 
match between
-- 
2.47.3
